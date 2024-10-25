
import { Request } from '@yt/YtKit'
import { CollectArticleListDataModel } from '../models/Collect'

/**
 * 获取收藏列表
 */
export const  getCollectList = (page: number) => {
  return Request.get<CollectArticleListDataModel>(`/lg/collect/list/${page}/json`)
}

/**
 * 收藏站内文章
 */

export const collectArticle = (id: number) => {
  return Request.post<string>(`/lg/collect/${id}/json`)
}

/**
 * 取消收藏
 */
export const unCollectArticle = (id: number) => {
  return Request.post<string>(`/lg/uncollect_originId/${id}/json`)
}
