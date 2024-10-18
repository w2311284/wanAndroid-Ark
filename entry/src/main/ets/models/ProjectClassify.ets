export class ProjectClassifyModel {
  articleList: [] = []
  author: string = ''
  children: string = ''
  courseId: number = 0
  cover: string = ''
  desc: string = ''
  id: number = 0
  lisense: string = ''
  lisenseLink: string = ''
  name: string = ''
  order: number = 0
  parentChapterId: number = 0
  type: number = 0
  userControlSetTop: boolean = false
  visible: number = 0
}

export interface ProjectClassifyParams {
  cid: number,
  page_size: number
}

export class ProjectClassifyParamsModel implements ProjectClassifyParams {
  cid: number
  page_size: number

  constructor(model: ProjectClassifyParams) {
    this.cid = model.cid
    this.page_size = model.page_size
  }
}

