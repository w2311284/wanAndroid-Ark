export default class ServiceApi {
  static readonly SERVER: string = 'https://www.wanandroid.com';

  static readonly HTTP_READ_TIMEOUT: number = 10000;

  static readonly HTTP_CODE_200: number = 200;

  static readonly SERVICE_CODE_SUCCESS: number = 0;

  static readonly PAGE_SIZE: number = 10;

  static readonly GET_BANNER_LIST: string = 'banner/json';

  static readonly  GET_HOME_TOPIC_ARTICLE_LIST: string = 'article/top/json'

  static readonly GET_HOME_ARTICLE_LIST: string = 'article/list';
  /// 获取广场列表
  static readonly  GET_HOME_SQUARE_LIST: string = 'user_article/list'
  /// 问答列表
  static readonly  GET_HOME_WENDA_LIST: string = 'wenda/list'
}

export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}

export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}