interface CustomNavBarButtonOptions {
  icon?: ResourceStr;
  onClick?: () => void;
}

interface CustomNavBarTitleOptions {
  fontSize?: number;
  fontWeight?: FontWeight;
  text?: string;
  fontColor?: string;
  onClick?: () => void;
}

interface CustomNavBarOptions {
  backgroundColor?: ResourceStr;
}

@Component
struct YtCustomBaseNavBar {
  @State titleOptions: CustomNavBarTitleOptions = {
    fontSize: 18,
    fontWeight: FontWeight.Normal,
    text: '',
    fontColor: '#2785ff',
    onClick: () => {
    }
  };
  @State navOptions: CustomNavBarOptions = {
    backgroundColor : $r('app.color.white')
  }
  @State leftButtons: Array<CustomNavBarButtonOptions> = [];
  @State rightButtons: Array<CustomNavBarButtonOptions> = [];

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      ForEach(this.leftButtons, (item: CustomNavBarButtonOptions) => {
        Row({ space: 'between' }) {
          Image(item.icon).width(24).height(24).onClick(item.onClick)
        }
      })

      Blank().width(15)

      Text(this.titleOptions.text)
        .textAlign(TextAlign.Center)
        .fontSize(this.titleOptions.fontSize)
        .fontWeight(this.titleOptions.fontWeight)
        .fontColor(this.titleOptions.fontColor)
        .onClick(this.titleOptions.onClick)

      Blank().width(15)

      ForEach(this.rightButtons, (item: CustomNavBarButtonOptions) => {
        Row({ space: 'between' }) {
          Image(item.icon).width(24).height(24).onClick(item.onClick)
        }
      })
    }.height(45).width('100%').backgroundColor(this.navOptions.backgroundColor)
  }
}

@Component
struct TitleBar {
  @State isNeedBack: boolean = false;
  @State title: string = "";
  onBackClick ?: () => void;

  build() {
    YtCustomBaseNavBar({
      titleOptions: { text: this.title,fontColor: '#ffffff' },
      leftButtons: this.isNeedBack ? [{ icon: $r('app.media.ic_arrow_back'), onClick: this.onBackClick}] : []
    })
  }
}

export { YtCustomBaseNavBar, TitleBar }
