//
//  APIRequest
//  weather
//
//  Created by 遠藤拓弥 on 2019/03/24.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import APIKit

protocol APIRequest: Request { }

extension APIRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser() as DataParser
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

final class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}
