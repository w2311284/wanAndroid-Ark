export default class ServiceApi {
  static readonly SERVER: string = 'https://www.wanandroid.com';

  static readonly HTTP_READ_TIMEOUT: number = 10000;

  static readonly HTTP_CODE_200: number = 200;

  static readonly SERVICE_CODE_SUCCESS: number = 0;

  static readonly PAGE_SIZE: number = 10;

  static readonly GET_BANNER_LIST: string = 'banner/json';

  static readonly GET_HOME_TOPIC_ARTICLE_LIST: string = 'article/top/json'

  static readonly GET_HOME_ARTICLE_LIST: string = 'article/list';
  /// 获取广场列表
  static readonly GET_HOME_SQUARE_LIST: string = 'user_article/list'
  /// 问答列表
  static readonly GET_HOME_WENDA_LIST: string = 'wenda/list'

  /** 项目 */
  /**
   * 项目分类数据
   */
  static readonly GET_PROJECT_TREE: string = 'project/tree/json'

  /**
   * 最新项目列表
   */
  static readonly GET_PROJECT_NEWEST_LIST: string = 'article/listproject'

  /**
   * 项目文章列表
   */
  static readonly GET_PROJECT_LIST:string = 'project/list'


  /**
   * 公众号作者列表
   */
  static readonly GET_GROUP_AUTHOR_LIST: string = 'wxarticle/chapters/json'

  /**
   * 对于作者的文章
   */
  static readonly GET_GROUP_AUTHOR_ARTICLE_LIST: string = 'wxarticle/list'

}

export const enum ContentType1 {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}

export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}