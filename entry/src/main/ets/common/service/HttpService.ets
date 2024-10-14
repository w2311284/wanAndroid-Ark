// HttpUtil.ets
import http from '@ohos.net.http';
import ServiceApi, { ContentType1 } from './ServiceApi';
import ResponseResult from '../model/ResponseResult';
// GET请求
export function httpRequestGet(url: string) {
  return httpRequest(url, http.RequestMethod.GET);
}

// POST请求
export function httpRequestPost(url: string, params: Object) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

function httpRequest(url: string, method: http.RequestMethod, params?: Object): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: ServiceApi.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type':  ContentType1.JSON
    },
    connectTimeout: ServiceApi.HTTP_READ_TIMEOUT,
    extraData: params
  });
  let serverData = new ResponseResult();
  // 处理数据，并返回
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === ServiceApi.HTTP_CODE_200) {
      // 获取返回数据
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else {
      serverData.errorMsg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = $r('app.string.http_error_message');
    return serverData;
  });
}