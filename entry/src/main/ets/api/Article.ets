import { YTRequest } from '@yt/foundation'
import { ArticleListDataModel } from '../models/Article'
import { ARTICLE_RECOMMEND_LIST, ARTICLE_SQUARE_LIST, QA_LIST } from './Url'

/**
 * 获取推荐文章列表
 */
export const getArticleList = (page: number) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${ARTICLE_RECOMMEND_LIST}${page}/json?page_size=10`)
}

/**
 * 获取广场文章列表
 */
export const getSquareList = (page: number) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${ARTICLE_SQUARE_LIST}${page}/json?page_size=10`)
}

/**
 * 获取问答文章列表
 */
export const getAnswerList = (page: number) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${QA_LIST}${page}/json?page_size=10`)
}
