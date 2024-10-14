import { ProjectConstants } from '../../constants/ProjectConstants'
import { ProjectList } from './ProjectList'

@Preview
@Component
export default struct Project {
  build(){
    Tabs(){
      ForEach(ProjectConstants.PROJECT_TOPIC_LIST,(item: string) => {
        TabContent() {
          ProjectList()
        }
        .tabBar(item)
      })
    }
    .scrollable(true)
    .barMode(BarMode.Scrollable)
  }
}