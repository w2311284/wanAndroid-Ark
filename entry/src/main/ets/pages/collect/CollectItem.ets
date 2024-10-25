import { collectArticle, unCollectArticle } from '../../api/Collect'
import { CollectArticleItemModel } from '../../models/Collect'

@Preview
@Component
export struct CollectItem {
  @State article: CollectArticleItemModel = new CollectArticleItemModel()

  aboutToAppear(): void {
    this.article.collect = true
  }

  build() {
    Column() {
      Text(this.article.title)
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
        .margin({ bottom: 10 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Row() {
        Text(`作者：${this.article.author} ${this.article.niceDate}`)
          .fontSize(14)
        Image(this.article.collect ? $r('app.media.ic_collect') : $r('app.media.ic_un_collect'))
          .width(24)
          .height(24)
          .onClick(async () => {
            if (this.article.collect) {
              await unCollectArticle(this.article.originId === -1 ? this.article.id : this.article.originId)
              this.article.collect = false
            } else {
              await collectArticle(this.article.id)
              this.article.collect = true
            }
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(10)
    .borderRadius(10)
    .backgroundColor($r('app.color.surface_dim'))
  }
}