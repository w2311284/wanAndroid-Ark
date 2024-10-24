import { preferences } from '@kit.ArkData'
import { Context } from '@ohos.arkui.UIContext'
import { TOKEN_KEY, USER_SETTING } from '../constants'

export class UserSetting {
  context: Context

  constructor(ctx: Context) {
    this.context = ctx
  }
  /**
   * 获取仓库
   */
  getStore() {
    return preferences.getPreferencesSync(this.context,{name: USER_SETTING})
  }

  /**
   * 获取token
   */
  getToken() {
    const store = this.getStore()
    return store.getSync(TOKEN_KEY,"") as string
  }

  /**
   * 设置token
   */
  async setToken(token: string) {
    const store = this.getStore()
    store.putSync(TOKEN_KEY,token)
    await store.flush()
  }


}