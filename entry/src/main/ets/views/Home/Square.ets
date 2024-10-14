import { getSquareList } from '../../api/HomeApi'
import Article from '../../common/model/ArticleModel'
import Page from '../../common/model/PageModel'
import { ArticleItem } from './ArticleItem'

@Preview
@Component
export default struct Square {
  @State articles: Array<Article> = []

  aboutToAppear(): void {
    getSquareList(1).then((data: Page) => {
      this.articles = data.datas
    })
  }

  build() {
    List() {
      ForEach(this.articles, (item: Article) => {
        ArticleItem({ item: item })
      })
    }
  }
}