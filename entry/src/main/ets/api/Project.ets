import { Request } from '@yt/YtKit';
import { ArticleListDataModel } from '../models/Article';
import { ProjectClassifyModel, ProjectClassifyParamsModel } from '../models/ProjectClassify';


/**
 * 获取项目列表
 */
export const getProjectList = (page: number,params: ProjectClassifyParamsModel) => {
  return Request.get<ArticleListDataModel>(`/project/list/${page}/json`,params)
}

/**
 * 获取‘最新项目’列表
 */
export const getNewestProjectList = (page: number) => {
  return Request.get<ArticleListDataModel>(`/article/listproject/${page}/json`)
}

/**
 *  获取项目分类
 */
export const getProjectClassify = () => {
  return Request.get<ProjectClassifyModel[]>('/project/tree/json')
}