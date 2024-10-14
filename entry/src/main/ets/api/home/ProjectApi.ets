import Page from '../../common/model/PageModel';
import ResponseResult from '../../common/model/ResponseResult';
import { httpRequestGet } from '../../common/service/HttpService';
import ServiceApi from '../../common/service/ServiceApi';

/**
 * 获取最新项目列表
 * @param pageNo
 * @returns
 */
export function getProjectNewestList(pageNo: number, pageSize:number = 10) : Promise<Page> {
  return new Promise(async  (resolve: Function, reject:Function) => {

    const url =  `${ServiceApi.SERVER}/${ServiceApi.GET_PROJECT_NEWEST_LIST}/${pageNo}/json?page_size=${pageSize}`

    httpRequestGet(url).then((result: ResponseResult) => {
      if(result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS){
        resolve(result.data)
      }else  {
        reject($r('app.string.service_request_error_message'))
      }
    }).catch((err: Error) => {
      reject($r('app.string.http_error_message'));
    })
  })
}