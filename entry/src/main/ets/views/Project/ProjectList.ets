import { getProjectNewestList } from '../../api/ProjectApi'
import Article from '../../common/model/ArticleModel'
import Page from '../../common/model/PageModel'
import { ProjectItem } from './ProjectItem'

@Preview
@Component
export struct ProjectList {

  @State private newestList: Array<Article> = [];

  aboutToAppear(): void {
    getProjectNewestList(0).then((data: Page) => {
      this.newestList = data.datas
    })
  }

  build() {
    List() {
      ForEach(this.newestList, (item: Article) => {
        ListItem() {
          ProjectItem({item})
        }
        .margin({left:10, right:10, bottom:5,top:5})
        .backgroundColor(Color.White)
      })
    }
    .backgroundColor(Color.White)
  }
}