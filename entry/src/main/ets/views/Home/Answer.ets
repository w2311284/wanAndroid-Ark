import { getWendaList } from '../../api/home/HomeApi'
import Article from '../../common/model/ArticleModel'
import Page from '../../common/model/PageModel'
import { ArticleItem } from './ArticleItem'

@Preview
@Component
export default struct Answer {

  @State articles: Array<Article> = []

  aboutToAppear(): void {
      getWendaList(1).then((data: Page) => {
        this.articles = data.datas;
      })
  }
  build(){
    List() {
      ForEach(this.articles, (item: Article) => {
        ListItem() {
          ArticleItem({item})
        }
      })
    }
  }
}