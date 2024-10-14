import Page from '../common/model/PageModel';
import ResponseResult from '../common/model/ResponseResult';
import { httpRequestGet } from '../common/service/HttpService';
import ServiceApi from '../common/service/ServiceApi';
import Classify from '../model/Classify';

/**
 * 公众号作者列表
 */

export function getAuthorList(): Promise<Classify[]> {
  return new Promise(async (resolve: Function, reject: Function) => {
    let url = `${ServiceApi.SERVER}/${ServiceApi.GET_GROUP_AUTHOR_LIST}`;
    httpRequestGet(url).then((result: ResponseResult) => {
      if(result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        resolve(result.data)
      }else  {
        reject($r('app.string.service_request_error_message'));
      }
    }).catch((err: Error) => {
      reject($r('app.string.http_error_message'));
    })
  })
}

export function getAuthorArticles(id: number, page: number = 0, pageSize: number = 10): Promise<Page> {
  return new Promise(async (resolve: Function, reject: Function) => {
    let url = `${ServiceApi.SERVER}/${ServiceApi.GET_GROUP_AUTHOR_ARTICLE_LIST}/${id}/${page}/json?page_size=${pageSize}`;
    httpRequestGet(url).then((result: ResponseResult) => {
      if(result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        resolve(result.data)
      }else  {
        reject($r('app.string.service_request_error_message'));
      }
    }).catch((err: Error) => {
      reject($r('app.string.http_error_message'));
    })
  })
}

