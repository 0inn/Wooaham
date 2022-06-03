//
//  MapResponse.swift
//  Wooaham
//
//  Created by 김영인 on 2022/06/03.
//

struct MapResponse: Codable {
    let success: Bool
    let data: MapData
    let error: Bool?
}

struct MapData: Codable {
    let lng, lat: Double
}
