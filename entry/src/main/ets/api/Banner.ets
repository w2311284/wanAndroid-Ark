import { YTRequest } from '@yt/foundation'
import BannerItemModel from '../models/Banner'
import { BANNER } from './Url'

/**
 * 获取banner
 */
export const getBannerList = () => {
  return YTRequest.shared().get<BannerItemModel[]>(BANNER)
}