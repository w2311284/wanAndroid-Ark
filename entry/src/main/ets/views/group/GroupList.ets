import { getAuthorArticles } from '../../api/GroupApi'
import Article from '../../common/model/ArticleModel'
import Page from '../../common/model/PageModel'
import Classify from '../../model/Classify'
import { ArticleItem } from '../Home/ArticleItem'

@Component
export struct GroupList {
  private author: Classify = new Classify()
  @State articles: Array<Article> = []
  aboutToAppear(): void {
    getAuthorArticles(this.author.id).then((data: Page) => {
      this.articles = data.datas
    })
  }

  build() {
    List(){
      ForEach(this.articles,(article: Article) => {
        ListItem() {
          ArticleItem({item:article})
        }
      })
    }
  }
}