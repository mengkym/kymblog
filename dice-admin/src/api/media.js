import request from '@/utils/request'

export function getMediaList(params) {
  return request({
    url: '/admin/media',
    method: 'get',
    params: params
  })
}

export function getMediaTypes(params) {
  return request({
    url: '/admin/media/media_types',
    method: 'get'
  })
}

export function deleteMedia(id) {
  return request(
    {
      url: '/admin/media/' + id,
      method: 'delete'
    }
  )
}

