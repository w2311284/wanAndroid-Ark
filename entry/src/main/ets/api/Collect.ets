
import { Request } from '@yt/YtKit'
import { ArticleListDataModel } from '../models/Article'

/**
 * 获取收藏列表
 */
export const  getCollectList = (page: number) => {
  return Request.get<ArticleListDataModel>(`/lg/collect/list/${page}/json`)
}