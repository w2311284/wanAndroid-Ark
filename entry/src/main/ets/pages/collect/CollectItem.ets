import { ArticleInfoItemModel } from '../../models/Article'

@Preview
@Component
export struct CollectItem {
  article: ArticleInfoItemModel = new ArticleInfoItemModel()

  build() {
    Column() {
        Text(this.article.title)
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
        .margin({bottom:10})
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
      Row() {
          Text(`作者：${this.article.author} ${this.article.niceDate}`)
            .fontSize(14)
        Image($r('app.media.ic_collect'))
          .width(24)
          .height(24)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
    .width('100%')
    // .height(64)
    .alignItems(HorizontalAlign.Start)
    .padding(10)
    .borderRadius(10)
    .backgroundColor($r('app.color.surface_dim'))
  }
}