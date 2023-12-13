import Constants from '../../common/constants/Constants'
import Banner from '../../common/model/BannerModel';
import HomeViewModel from '../../viewModel/HomeViewModel';


@Component
export default struct Recommended {
  @State bannerList: Banner[] = [];
  @State refreshStatus: boolean = false;
  private swiperController: SwiperController = new SwiperController();
  build(){
    Scroll(){
      Column(){
        Swiper(this.swiperController){
          ForEach(this.bannerList,(item: Banner)=>{
             Stack(){
               // Image(item.imagePath)
               //   .objectFit(ImageFit.Fill)
               //   .width(Constants.FULL_PARENT)
               //   .height(Constants.FULL_PARENT)
               //   .borderRadius(Constants.BANNER_BORDER_RADIUS)
               //   .onClick(()=>{
               //      //点击Banner
               //   })
             }
          })
        }
        .width(Constants.FULL_PARENT)
        .height(Constants.BANNER_HEIGHT)
      }
    }
    .width(Constants.FULL_PARENT)
    .height(Constants.FULL_PARENT)
    .onTouch((event ?: TouchEvent)=>{

    })
  }



  aboutToAppear(){
    HomeViewModel.getBanner().then((banners : Banner[])=>{
      this.bannerList = banners;
    })

    // startPlay(this.swiperController);
  }
  aboutToDisappear() {
    // stopPlay();
  }
}