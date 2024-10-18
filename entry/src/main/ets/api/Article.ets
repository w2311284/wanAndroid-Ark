import { Request } from '@yt/YtKit'
import { ArticleListDataModel } from '../models/Article'

/**
 * 获取推荐文章列表
 */
export const getArticleList = (page: number) => {
  return Request.get<ArticleListDataModel>(`/article/list/${page}/json?page_size=10`)
}

/**
 * 获取广场文章列表
 */
export const getSquareList = (page: number) => {
  return Request.get<ArticleListDataModel>(`/user_article/list/${page}/json?page_size=10`)
}

/**
 * 获取问答文章列表
 */
export const getAnswerList = (page: number) => {
  return Request.get<ArticleListDataModel>(`/wenda/list/${page}/json?page_size=10`)
}
