import { YTRequest } from '@yt/foundation';
import { BASE_URL } from '@yt/YtKit';
import { ArticleListDataModel } from '../models/Article';
import AuthorModel from '../models/Author';
import { ARTICLE_FOR_AUTHOR, GROUP_AUTHOR_LIST } from './Url';

/**
 * 公众号作者列表
 */
export const getAuthorList = () => {
  return YTRequest.shared().get<AuthorModel[]>(GROUP_AUTHOR_LIST)
}

/**
 * 根据作者id获取文章
 */
export const getArticleByAuthor = (id: number, page: number) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${ARTICLE_FOR_AUTHOR}${id}/${page}/json?page_size=10`)
}

