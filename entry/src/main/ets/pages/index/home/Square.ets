import { YtList } from '@yt/YtKit'
import { getSquareList } from '../../../api/Article'
import { ArticleInfoItemModel } from '../../../models/Article'
import { ArticleItem } from './ArticleItem'

@Preview
@Component
export default struct Square {
  @State articles: Array<ArticleInfoItemModel> = []
  @State page: number = 0
  @State totalPage: number = 1

  async getSquareList(append: boolean) {
    const result = await getSquareList(this.page)
    if (append) {
      this.articles.push(...result.datas)
    }else {
      this.articles = result.datas
    }
    this.totalPage = result.pageCount
    this.page++
  }

  async onRefresh() {
    this.page = 0
    await this.getSquareList(false)
  }

  @Builder
  getArticleItem(item: object) {
    ArticleItem({item: item as ArticleInfoItemModel})
  }

  build() {
    YtList({
      dataSource: this.articles,
      finished: this.totalPage < this.page,
      onLoad: async () => {
        await this.getSquareList(true)
      },
      onRefresh: async () => {
        await this.onRefresh()
      },
      renderItem: (item: object) => {
        this.getArticleItem(item)
      }
    })
  }
}