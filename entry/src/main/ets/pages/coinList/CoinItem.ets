import { Coin, CoinModel } from '../../models/Coin'

@Preview
@Component
export struct CoinItem {

  coinItem: CoinModel = new CoinModel({} as Coin)

  build() {
    Row(){
      Column(){
        Text(this.coinItem.reason)
          .fontSize(14)
          .fontWeight(500)
          .fontColor($r('app.color.secondary'))
        Text(this.coinItem.desc)
          .fontSize(12)
          .fontColor($r('app.color.secondary'))
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      .height('100%')

      Text(`+${this.coinItem.coinCount}`)
        .fontColor($r('app.color.primary'))
        .fontSize(14)
    }
    .padding({left: 12, right: 12,top: 8, bottom: 8})
    .width('100%')
    .height(54)
    .justifyContent(FlexAlign.SpaceBetween)
    .border({width:{bottom: 0.5},color: $r('app.color.surface_dim')})
  }
}