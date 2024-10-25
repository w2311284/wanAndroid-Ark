import { Request } from '@yt/YtKit'
import { ToolModel } from '../models/Tool'
import { LoginFormModel,  UserInfoModel, UserModel } from '../models/User'

export const login = (params: LoginFormModel) => {
  return Request.post<UserInfoModel>('/user/login',params)
}

export const getUserInfo = () => {
  return Request.get<UserModel>('/user/lg/userinfo/json')
}

export const getToolList = () => {
  return Request.get<ToolModel[]>('/tools/list/json')
}