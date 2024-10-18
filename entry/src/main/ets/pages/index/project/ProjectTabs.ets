import { getProjectClassify } from '../../../api/Project'
import { ProjectClassifyModel } from '../../../models/ProjectClassify'
import { ProjectList } from './ProjectList'

@Preview
@Component
export default struct ProjectTabs {

  @State classifyList: ProjectClassifyModel[] = [{
    name: '最新项目',
    id: -1
  } as ProjectClassifyModel]

  aboutToAppear(): void {
    this.getProjectClassify()
  }

  async getProjectClassify() {
    const  list = await getProjectClassify()
    this.classifyList.push(...list)
  }

  build() {
    Tabs() {
      ForEach(this.classifyList, (item: ProjectClassifyModel) => {
        TabContent() {
          ProjectList({ projectClassify: item })
        }
        .tabBar(item.name)
      })
    }
    .scrollable(true)
    .barMode(BarMode.Scrollable)
  }
}