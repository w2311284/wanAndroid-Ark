import Article, { Tag } from '../../common/model/ArticleModel'
import { ArticleItem } from './ArticleItem'

@Preview
@Component
export struct PersonProfile {

  build() {
    NavDestination() {
      this.ContainerView()
    }
    .hideTitleBar(true)
  }

  @Builder
  ContainerView() {
    Column().width('100%').height(100).backgroundColor(Color.Red)
  }

  mockArticle1(): Article {
    let item = new Article()
    item.author = "mark zhang"
    item.title = "测试模拟数据，mock的 哈哈哈"
    let tag: Tag = new Tag()
    tag.name = "mock 广场"
    item.tags = [tag]
    item.niceDate = "2024-09-11"
    return item;
  }
}
