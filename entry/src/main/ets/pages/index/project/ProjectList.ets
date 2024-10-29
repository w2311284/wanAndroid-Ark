import { YtList } from '@yt/YtKit';
import { getNewestProjectList, getProjectList } from '../../../api/Project'
import { ArticleInfoItemModel, ArticleListDataModel } from '../../../models/Article';
import {
  ProjectClassifyModel,
  ProjectClassifyParams,
  ProjectClassifyParamsModel
} from '../../../models/ProjectClassify';
import { ProjectItem } from './ProjectItem'

@Preview
@Component
export struct ProjectList {
  projectClassify: Partial<ProjectClassifyModel> = {}
  @State queryParams: ProjectClassifyParamsModel = new ProjectClassifyParamsModel({} as ProjectClassifyParams)
  @State private projectList: Array<ArticleInfoItemModel> = [];
  @State page: number = 0
  @State totalPage: number = 1

  async getProjectList(append: boolean) {

    let result: ArticleListDataModel
    if (this.projectClassify.name === '最新项目') {
      result = await getNewestProjectList(this.page)
    } else {
      this.queryParams = new ProjectClassifyParamsModel({
        cid: this.projectClassify.id,
        page_size: 10
      } as ProjectClassifyParams)
      result = await getProjectList(this.page, this.queryParams)
    }

    if (append) {
      this.projectList.push(...result.datas)
    } else {
      this.projectList = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  async onRefresh() {
    this.page = 0
    await this.getProjectList(false)
  }

  @Builder
  getProjectCard(project: object) {
    ProjectItem({ item: project as ArticleInfoItemModel })
  }

  build() {
    YtList({
      dataSource: this.projectList,
      renderItem: (project: object) => {
        this.getProjectCard(project)
      },
      onRefresh: async () => {
        await this.onRefresh()
      },
      onLoad: async () => {
        await this.getProjectList(true)
      }
    })
  }
}