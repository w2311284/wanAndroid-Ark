import { YTRequest } from '@yt/foundation';
import { ArticleListDataModel } from '../models/Article';
import { ProjectClassifyModel, ProjectClassifyParamsModel } from '../models/ProjectClassify';
import { NEW_PROJECT_LIST, PROJECT_CLASSIFY, PROJECT_LIST } from './Url';


/**
 * 获取项目列表
 */
export const getProjectList = (page: number,params: ProjectClassifyParamsModel) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${PROJECT_LIST}${page}/json`,params)
}

/**
 * 获取‘最新项目’列表
 */
export const getNewestProjectList = (page: number) => {
  return YTRequest.shared().get<ArticleListDataModel>(`${NEW_PROJECT_LIST}${page}/json`)
}

/**
 *  获取项目分类
 */
export const getProjectClassify = () => {
  return YTRequest.shared().get<ProjectClassifyModel[]>(PROJECT_CLASSIFY)
}