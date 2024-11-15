import { YTRequest } from '@yt/foundation'
import { CollectArticleListDataModel } from '../models/Collect'
import { COLLECTION_ARTICLE, COLLECTION_LIST, UN_COLLECTION } from './Url'

/**
 * 获取收藏列表
 */
export const  getCollectList = (page: number) => {
  return YTRequest.shared().get<CollectArticleListDataModel>(`${COLLECTION_LIST}${page}/json`)
}

/**
 * 收藏站内文章
 */

export const collectArticle = (id: number) => {
  return YTRequest.shared().post<string>(`${COLLECTION_ARTICLE}${id}/json`)
}

/**
 * 取消收藏
 */
export const unCollectArticle = (id: number) => {
  return YTRequest.shared().post<string>(`${UN_COLLECTION}${id}/json`)
}
