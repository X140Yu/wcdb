
/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

public class Column: Describable {
    
    public static let any: Column = Column(named: "*")
    public static let rowid: Column = Column(named: "rowid")
    
    public init(named name: String) {
        super.init(name)
    }

    public convenience override init(_ name: String) {
        self.init(named: name)
    }
    
    public var name: String {
        return description
    }
    
    public func `in`(table: String) -> Column {
        return Column(table + "." + self.name)
    }
}

extension Column: ColumnConvertible, ExpressionOperable {
    public func asColumn() -> Column {
        return self
    }
}
