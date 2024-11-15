import { YtList } from '@yt/YtKit'
import { getArticleByAuthor  } from '../../../api/Group'
import { ArticleInfoItemModel } from '../../../models/Article'
import AuthorModel from '../../../models/Author'
import { ArticleItem } from '../home/ArticleItem'

@Component
export struct GroupList {
  author: AuthorModel = new AuthorModel()
  @State articles: Array<ArticleInfoItemModel> = []
  @State page: number = 0
  @State totalPage: number = 1

  async getArticleByAuthor(append: boolean) {
    const result = await getArticleByAuthor( this.author.id, this.page)
    if(append) {
      this.articles.push(...result.datas)
    }else {
      this.articles = result.datas
    }
    this.totalPage = result.pageCount
    this.page++
  }

  async onRefresh() {
    this.page = 0
    await this.getArticleByAuthor(false)
  }

  @Builder
  getItemCard(item: object) {
    ArticleItem({item: item as ArticleInfoItemModel})
  }

  build() {
    YtList({
      dataSource: this.articles,
      renderItem: (item: object) => {
        this.getItemCard(item)
      },
      onLoad: async () => {
         await this.getArticleByAuthor(true)
      },
      onRefresh: async () => {
        await this.onRefresh()
      }
    })
  }
}