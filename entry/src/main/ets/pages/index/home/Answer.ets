import { YtList } from '@yt/YtKit/'
import { getAnswerList } from '../../../api/Article'
import { ArticleInfoItemModel  } from '../../../models/Article'
import { ArticleItem } from './ArticleItem'

@Preview
@Component
export default struct Answer {

  @State articles: Array<ArticleInfoItemModel> = []
  @State page: number = 0
  @State totalPage: number = 1

  async getAnswerList(append: boolean) {
    const result = await getAnswerList(this.page)
    if (append) {
      this.articles.push(...result.datas)
    }else  {
      this.articles = result.datas
    }
    this.page++
    this.totalPage = result.pageCount
  }

  async onRefresh() {
    this.page = 0
    setTimeout(() => {

    },1000)
    await this.getAnswerList(false)
  }

  @Builder
  getArticleItem(item: object) {
    ArticleItem({item: item as ArticleInfoItemModel})
  }

  build(){
    YtList({
      dataSource: this.articles,
      finished: this.totalPage < this.page,
      onRefresh: async () => {
        await this.onRefresh()
      },
      onLoad: async () => {
        await this.getAnswerList(true)
      },
      renderItem: (item: object) => {
        this.getArticleItem(item)
      },

    })
  }
}