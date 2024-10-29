import {  getAuthorList } from '../../../api/Group'
import AuthorModel from '../../../models/Author'
import { GroupList } from './GroupList'

@Preview
@Component
export struct GroupTabs {
  mock: AuthorModel = new AuthorModel()
  @State authorNames: Array<AuthorModel> = []

  aboutToAppear(): void {
    this.getAuthorList()
  }

  async getAuthorList() {
    this.authorNames = await getAuthorList()
  }

  build() {
    Tabs({barPosition: BarPosition.Start}) {
      ForEach(this.authorNames, (author: AuthorModel) => {
        TabContent() {
          GroupList({author:author})
        }
        .tabBar(author.name)
      })
    }
    .barMode(BarMode.Scrollable)
    .scrollable(true)
    .backgroundColor($r('app.color.surface'))
  }
}

