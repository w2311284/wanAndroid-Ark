import { BASE_URL } from '../constants'
import http from '@ohos.net.http';
import { KeyboardAvoidMode, promptAction  } from '@kit.ArkUI';
import { ResponseData } from '../models';

async function requestHttp<T>(url: string = "", method: http.RequestMethod = http.RequestMethod.GET, data?: object): Promise<T> {

  const httpRequest = http.createHttp()

  let urlStr = BASE_URL + url
  let postParam = ''
  if (method === http.RequestMethod.GET) {
    if (data && Object.keys(data).length) {
      urlStr += "?" + Object.keys(data).filter(key => !!data[key]).map(key => {
        return `${key}=${data[key]}`
      }).join('&')
    }
  }

  // urlencode
  if(method === http.RequestMethod.POST){
    if (data && Object.keys(data).length) {
       postParam = Object.keys(data).filter(key => !!data[key]).map(key => {
        return `${encodeURI(key)}=${encodeURI(data[key])}`
      }).join('&')
    }
  }

  const config: http.HttpRequestOptions = {
    extraData: method !== http.RequestMethod.GET ? postParam : "",
    header: {
      "Content-Type": method === http.RequestMethod.POST ? "application/x-www-form-urlencoded" : "application/json",
    },
    method: method,
    readTimeout: 20000
  }

  try {
    const result = await httpRequest.request(urlStr,config)
    if (result.responseCode === 401) {
      // 401表示token失效 超时 或者没传
      return Promise.reject(new Error('登录失效'))
    }else if (result.responseCode === 404) {
      promptAction.showToast({message: '请求地址错误'})
      return Promise.reject(new Error('请求地址错误'))
    } else  {
      const res = JSON.parse(result.result as string) as ResponseData<T>
      if (res.errorCode === 0) {
        return res.data as T
      } else  {
        promptAction.showToast({message: res.errorMsg})
        return Promise.reject(new Error('服务器异常'))
      }
    }
  } catch (error) {
    return Promise.reject(new Error('服务器异常 catch'))
  }
}

export class Request {
  static get<T>(url: string, data?: object) : Promise<T> {
    return requestHttp<T>(url,http.RequestMethod.GET,data)
  }
  static post<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url,http.RequestMethod.POST,data)
  }

  static delete<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url,http.RequestMethod.DELETE,data)
  }

  static put<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url,http.RequestMethod.PUT,data)
  }
}