import ServiceApi from '../common/constants/ServiceApi';
import Banner from '../common/model/BannerModel';
import Article, { Tag } from '../common/model/ArticleModel'
import Page from '../common/model/PageModel';
import ResponseResult from '../common/model/ResponseResult';
import { httpRequestGet } from '../common/service/HttpService';
import Logger from '../common/utils/Logger';
export default class HomeViewModel {
  banners: Array<Banner> = []
  articles: Array<Article> = []

  constructor() {
    this.banners =[]
    this.articles = []
  }


  static mockArticles(): Array<Article> {
    let item = new Article();
    item.author = "博洋"
    item.fresh = true;
    item.isTopic = true;
    let tag1 = new Tag()
    tag1.name = '本站发布'
    let tag2 = new Tag()
    tag2.name = '问答'
    item.tags = [ tag1 , tag2 ]
    item.niceDate = '刚刚'
    item.title = '每日一问|Service onStartCommand 返回STICKY是如何被辣货的'
    item.collect =false
    item.superChapterName = '问答'
    item.chapterName = '官方'
    return [item,item,item,item,item,item]
  }

  getBanner() : Promise<Banner[]>{
    return new Promise(async (resolve: Function,reject: Function) => {
      let url = `${ServiceApi.SERVER}/${ServiceApi.GET_BANNER_LIST}`;
      httpRequestGet(url).then((result: ResponseResult)=>{
        if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
          resolve(result.data)
        } else{
          Logger.error('getBanner failed', JSON.stringify(result));
          reject($r('app.string.service_request_error_message'));
        }
      }).catch((err : Error)=>{
        Logger.error('getBanner failed', JSON.stringify(err));
         reject($r('app.string.http_error_message'));
      })
    });
  }

  getHomeArticleList(pageNo: number) : Promise<Page>{
    return new Promise(async (resolve: Function,reject: Function) => {
      let url = `${ServiceApi.SERVER}/${ServiceApi.GET_HOME_ARTICLE_LIST}/${pageNo}/json?page_size=10`;
      httpRequestGet(url).then((result: ResponseResult)=>{
        if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
          console.log(JSON.stringify(result))
          resolve(result.data)
        } else{
          Logger.error('getBanner failed', JSON.stringify(result));
          reject($r('app.string.service_request_error_message'));
        }
      }).catch((err : Error)=>{
        Logger.error('getBanner failed', JSON.stringify(err));
        reject($r('app.string.http_error_message'));
      })
    });
  }

  getTopicArticleList() : Promise<Article[]> {
    return new Promise(async (resolve: Function,reject: Function) => {
      let url = `${ServiceApi.SERVER}/${ServiceApi.GET_HOME_ARTICLE_LIST}`;
      httpRequestGet(url).then((result: ResponseResult)=>{
        if (result.errorCode === ServiceApi.SERVICE_CODE_SUCCESS) {
          resolve(result.data)
        } else{
          reject($r('app.string.service_request_error_message'));
        }
      }).catch((err : Error)=>{
        reject($r('app.string.http_error_message'));
      })
    });
  }
}
