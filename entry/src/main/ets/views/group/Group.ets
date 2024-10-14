import {  getAuthorList } from '../../api/GroupApi'
import Classify from '../../model/Classify'
import { GroupList } from './GroupList'

@Preview
@Component
export struct Group {
  mock: Classify = new Classify()
  @State authorNames: Array<Classify> = [this.mock,this.mock]

  aboutToAppear(): void {
    this.mock.name = '弘扬'
    getAuthorList().then((data: Classify[]) => {
      this.authorNames = data
    })
  }

  build() {
    Tabs({barPosition: BarPosition.Start}) {
      ForEach(this.authorNames, (author: Classify) => {
        TabContent() {
          GroupList({author:author})
        }
        .tabBar(author.name)
      })
    }
    .barMode(BarMode.Scrollable)
    .scrollable(true)
  }
}

