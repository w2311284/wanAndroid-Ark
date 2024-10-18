import { Request } from '@yt/YtKit';
import { ArticleListDataModel } from '../models/Article';
import AuthorModel from '../models/Author';

/**
 * 公众号作者列表
 */
export const getAuthorList = () => {
  return Request.get<AuthorModel[]>('/wxarticle/chapters/json')
}

/**
 * 根据作者id获取文章
 */
export const getArticleByAuthor = (id: number, page: number) => {
  return Request.get<ArticleListDataModel>(`/wxarticle/list/${id}/${page}/json?page_size=10`)
}

