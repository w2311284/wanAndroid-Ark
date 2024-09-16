import ServiceApi from '../../common/constants/ServiceApi';
import Article from '../../common/model/ArticleModel';
import Banner from '../../common/model/BannerModel'
import Page from '../../common/model/PageModel';
import ResponseResult from '../../common/model/ResponseResult';
import { httpRequestGet } from '../../common/service/HttpService';
import Logger from '../../common/utils/Logger';

export function getSquareList(pageNo: number) : Promise<Page> {
    return new Promise(async (resolve: Function, reject: Function) => {
      const url = `${ServiceApi.SERVER}/${ServiceApi.GET_HOME_SQUARE_LIST}/${pageNo}/json?page_size=10`
        httpRequestGet(url).then((result: ResponseResult) => {
          if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
            resolve(result.data)
          }else  {
            reject($r('app.string.service_request_error_message'))
          }
      }).catch((err: Error) => {
          reject($r('app.string.http_error_message'));
      })
    })
}

export function getBanner(): Promise<Banner[]> {
  return new Promise(async (resolve: Function, reject: Function) => {
    let url = `${ServiceApi.SERVER}/${ServiceApi.GET_BANNER_LIST}`;
    httpRequestGet(url).then((result: ResponseResult) => {
      if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        resolve(result.data)
      } else {
        Logger.error('getBanner failed', JSON.stringify(result));
        reject($r('app.string.service_request_error_message'));
      }
    }).catch((err: Error) => {
      Logger.error('getBanner failed', JSON.stringify(err));
      reject($r('app.string.http_error_message'));
    })
  });
}

export function getHomeArticleList(pageNo: number): Promise<Page> {
  return new Promise(async (resolve: Function, reject: Function) => {
    let url = `${ServiceApi.SERVER}/${ServiceApi.GET_HOME_ARTICLE_LIST}/${pageNo}/json?page_size=10`;
    httpRequestGet(url).then((result: ResponseResult) => {
      if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        console.log(JSON.stringify(result))
        resolve(result.data)
      } else {
        Logger.error('getBanner failed', JSON.stringify(result));
        reject($r('app.string.service_request_error_message'));
      }
    }).catch((err: Error) => {
      Logger.error('getBanner failed', JSON.stringify(err));
      reject($r('app.string.http_error_message'));
    })
  });
}

export function getTopicArticleList(): Promise<Article[]> {
  return new Promise(async (resolve: Function, reject: Function) => {
    let url = `${ServiceApi.SERVER}/${ServiceApi.GET_HOME_ARTICLE_LIST}`;
    httpRequestGet(url).then((result: ResponseResult) => {
      if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
        resolve(result.data)
      } else {
        reject($r('app.string.service_request_error_message'));
      }
    }).catch((err: Error) => {
      reject($r('app.string.http_error_message'));
    })
  });
}