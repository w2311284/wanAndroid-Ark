import { webview } from '@kit.ArkWeb'
import { BusinessError } from '@kit.BasicServicesKit'
import { JSON } from '@kit.ArkTS'
import { COOKIE_KEY } from '../constants'

export class Cookie {
  static async setCookies(cookies?: string) {
    if (cookies && cookies.length > 0) {
      const result = Cookie.parseCookies(cookies)
      if (result.length > 0) {
        Cookie.clearAllCookies()
      }
      result.forEach((value) => {
        Cookie.saveCookieString(value)
      })
      await Cookie.saveCookieToDisk()
    }
  }

  static clearAllCookies() {
    webview.WebCookieManager.clearAllCookiesSync()
  }

  static parseCookies(cookies: string): string[] {
    let result: string[] = []
    let lines = cookies.split('\r\n')
    lines.forEach((line) => {
      let attrs = line.split('\t')
      if (attrs.length != 7 || !attrs[0]) {
        return
      }
      let item: string = attrs[5] + '=' + attrs[6]
      result.push(item)
    })
    return result
  }

  static saveCookieString(cookies: string) {
    let url = COOKIE_KEY
    try {
      webview.WebCookieManager.configCookieSync(url, cookies)
      console.log(`saveCookieString success url ${url} cookie ${cookies}`)
    } catch (error) {
      console.log(`saveCookieString falied url ${url} cookie ${cookies} error ${JSON.stringify(error)}`)
    }
  }

  static async saveCookieToDisk() {
    await webview.WebCookieManager.saveCookieAsync().then(() => {
      console.log('saveCookieToDisk success');
    }).catch((error: BusinessError) => {
      console.log(`saveCookieToDisk error ${JSON.stringify(error)}`);
    })
  }

  static getCookie(): string {
    let url = COOKIE_KEY
    try {
      const cookie = webview.WebCookieManager.fetchCookieSync(url, false)
      console.log(`getCookie  url ${url} cookie${cookie}`)
      return cookie
    } catch (error) {
      console.log(`getCookie  url ${url} cookie${JSON.stringify(error)}`)
      return ""
    }
  }

  static isLoginCookieValid(): boolean {
    let isUserNameValid = false
    let isUserTokenValid = false

    let result = Cookie.getCookie()
    result.split(';').map((value) => {
      let item = value.split('=')
      if (item.length !== 2) {
        return
      }
      if (item[0] === 'loginUserName_wanandroid_com') {
        isUserNameValid = item[1].length > 0
      }
      if (item[0] === 'token_pass_wanandroid_com') {
        isUserTokenValid = item[1].length > 0
      }
    })
    return isUserNameValid && isUserTokenValid
  }
}