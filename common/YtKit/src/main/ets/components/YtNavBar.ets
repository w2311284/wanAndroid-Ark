@Preview
@Component
struct YtNavBar {
  title: string = ''
  showBackIcon: boolean = true
  rightActions: YtNavButton[] = []
  backAction?: () => void = () => {
  }

  build() {

    Row() {
      // left action
      if (this.showBackIcon) {
        Image($r('app.media.ic_arrow_back')).width(24)
          .height(24)
          .onClick(() => {
            if (this.backAction) {
              this.backAction()
            }
          })
      }
      // title
      Text(this.title)
        .fontWeight(500)
        .fontSize(18)
        .fontColor(Color.Black)
        .layoutWeight(1)
        .margin({ left: 8, right: 8 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      // right buttons
      Row() {
        ForEach(this.rightActions, (button: YtNavButton) => {
          Image(button.icon)
            .width(24)
            .height(24)
        })
      }
    }
    .width('100%')
    .backgroundColor(Color.White)
    .height(64)
    .padding({ left: 16, right: 16 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


export { YtNavBar }

class YtNavButton {
  icon: ResourceStr = ''
  fontSize?: number = 12
  fontColor?: ResourceStr = ''
  action?: () => void = () => {
  }
}

export { YtNavButton }