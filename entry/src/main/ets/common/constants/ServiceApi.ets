export default class ServiceApi {
  static readonly SERVER: string = 'https://www.wanandroid.com';

  static readonly HTTP_READ_TIMEOUT: number = 10000;

  static readonly HTTP_CODE_200: number = 200;

  static readonly SERVICE_CODE_SUCCESS: number = 0;

  static readonly PAGE_SIZE: number = 10;

  static readonly GET_BANNER_LIST: string = 'banner/json';

  static readonly GET_HOME_ARTICLE_LIST: string = 'article/list';
}

export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}

export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}