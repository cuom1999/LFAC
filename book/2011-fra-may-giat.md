# Máy giặt ★★

**Tác giả đề:** Szymon Acedański  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `fra`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/fra>


## Đề bài

Một nhóm bạn quyết định giặt quần áo chung. Mọi người đều rất ngăn nắp: mỗi ngày, mỗi người dùng một đôi tất sạch và một chiếc áo sơ mi sạch. Họ đã bỏ tất và áo bẩn vào máy giặt, rồi bắt đầu tính cách phơi chúng.

Để mọi việc có trật tự, họ thống nhất rằng:

- mỗi **đôi tất** được kẹp lên dây bằng đúng một kẹp quần áo;
- mỗi **áo sơ mi** được kẹp bằng đúng ba kẹp;
- toàn bộ tất của cùng một người phải dùng các kẹp có cùng một màu;
- toàn bộ áo sơ mi của cùng một người phải dùng các kẹp có cùng một màu;
- quần áo của hai người khác nhau không được dùng kẹp cùng màu;
- ngoài các điều kiện trên, họ muốn dùng số **màu kẹp** ít nhất có thể.

Họ đã đổ toàn bộ kẹp xuống sàn và đếm được số kẹp của từng màu. Tuy nhiên, họ không biết nên phân các màu cho từng người như thế nào. Hãy viết chương trình giúp họ.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n\) và \(k\) (\(2\le n,k\le 1\,000\,000\)), lần lượt là số người bạn và số màu kẹp có sẵn.

Dòng thứ hai chứa \(n\) số nguyên \(d_1,d_2,\ldots,d_n\) (\(1\le d_i\le 1\,000\,000\)). Số \(d_i\) là số ngày người thứ \(i\) đã tích quần áo cần giặt.

Dòng thứ ba chứa \(k\) số nguyên \(l_1,l_2,\ldots,l_k\) (\(1\le l_j\le 4\,000\,000\)), trong đó \(l_j\) là số kẹp màu \(j\).

### Dữ liệu ra

In ra số màu kẹp ít nhất cần dùng để phơi hết quần áo. Nếu không thể phơi theo các quy tắc đã cho, in một từ duy nhất `NIE` (nghĩa là “không” trong tiếng Ba Lan).

### Ví dụ

**Dữ liệu vào**

```text
2 4
3 4
20 10 8 10
```

**Dữ liệu ra**

```text
3
```

**Dữ liệu vào**

```text
3 8
5 4 3
14 14 14 14 14 14 14 14
```

**Dữ liệu ra**

```text
NIE
```

Trong ví dụ đầu, người thứ nhất cần \(2\cdot3=6\) kẹp cho tất và \(3\cdot3=9\) kẹp cho áo. Người thứ hai cần lần lượt \(8\) và \(12\) kẹp. Người thứ hai có thể dùng toàn bộ 20 kẹp màu thứ nhất cho cả tất lẫn áo. Người thứ nhất khi đó có thể dùng, chẳng hạn, hai màu thứ hai và thứ tư.

## Lời giải

Người thứ \(i\) cần tổng cộng \(5d_i\) kẹp. Có hai cách cấp màu cho người đó:

- dùng **một màu**, nếu một màu có ít nhất \(5d_i\) kẹp; hoặc
- dùng **hai màu khác nhau**: một màu có ít nhất \(3d_i\) kẹp cho áo và một màu có ít nhất \(2d_i\) kẹp cho tất.

Không một màu nào được dùng cho hai người khác nhau. Do đó, một phương án hợp lệ dùng từ \(n\) đến \(2n\) màu. Muốn tối thiểu hóa số màu thì ta phải làm cho số người dùng được đúng một màu là lớn nhất, đồng thời vẫn phải phát hiện trường hợp không có phương án hợp lệ.

### Thuật toán tham lam

Xét những người theo thứ tự không tăng của \(d_i\), tức người có nhiều quần áo hơn được xét trước. Khi tới người có \(d_i\) ngày quần áo:

1. Nếu tồn tại một màu còn chưa dùng có ít nhất \(5d_i\) kẹp, cấp cho người này màu khả dụng có số kẹp **ít nhất** trong các màu đó.
2. Nếu không, nhưng có thể chọn hai màu còn chưa dùng — một màu có ít nhất \(2d_i\) kẹp và một màu khác có ít nhất \(3d_i\) kẹp — thì cấp hai màu khả dụng nhỏ nhất thỏa các ngưỡng tương ứng.
3. Nếu cả hai trường hợp đều không thể thực hiện, in `NIE`.

Sau khi một màu đã được cấp, loại toàn bộ màu đó khỏi tập màu còn có thể dùng. Số màu đã cấp là đáp án.

Việc ưu tiên người có nhiều quần áo là tự nhiên: họ có ít lựa chọn hơn. Nếu có thể dùng một màu thì luôn làm thế, vì đó là cách duy nhất để giảm số màu dùng. Cuối cùng, chọn màu vừa đủ nhỏ nhất để dành các màu lớn hơn cho những người khó tính hơn ở phía sau.

### Chứng minh tính đúng đắn

Ta sẽ chứng minh rằng nếu có lời giải thì thuật toán tham lam tìm được một lời giải dùng số màu ít nhất.

Gọi `ALG` là cách cấp màu do thuật toán tạo ra; nó có thể mới là một phương án một phần nếu thuật toán dừng vì không thể cấp màu cho ai đó. Gọi `OPT` là một phương án hợp lệ tối ưu, nghĩa là dùng ít màu nhất. Đánh số lại người sao cho

\[
d_1\ge d_2\ge\cdots\ge d_n,
\]

đúng theo thứ tự thuật toán xét.

Ta sẽ lần lượt biến đổi `OPT` sao cho ngày càng nhiều người đầu tiên được cấp giống hệt `ALG`, mà vẫn hợp lệ và không tăng số màu đã dùng. Giả sử \(i\) là người đầu tiên mà hai phương án cấp khác nhau.

Không thể có chuyện `ALG` không cấp được màu cho người \(i\), bởi khi ấy `ALG` vẫn có thể lấy đúng các màu mà `OPT` đã cấp cho người \(i\): ở các người trước đó, hai phương án hoàn toàn trùng nhau. Cũng không thể có chuyện `OPT` dùng một màu còn `ALG` dùng hai màu, vì thuật toán luôn dùng một màu nếu điều đó khả thi.

#### Hai phương án dùng cùng số màu cho người \(i\)

Trước hết, giả sử cả hai đều cấp một màu (trường hợp cả hai đều cấp hai màu tương tự). Gọi \(p\) là màu mà `OPT` cấp và \(a\) là màu mà `ALG` cấp. Vì thuật toán chọn màu phù hợp có số kẹp ít nhất, ta có

\[
l_a\le l_p.
\]

Nếu `OPT` chưa dùng màu \(a\), chỉ cần thay màu \(p\) của người \(i\) bằng \(a\). Nếu `OPT` đã dùng màu \(a\) cho một người \(j\), thì \(j>i\), vì những người trước đó đã trùng với `ALG`. Hoán đổi màu \(p\) và \(a\) giữa hai người \(i,j\). Màu \(a\) đủ cho người \(i\) theo cách `ALG` chọn; màu \(p\) đủ cho người \(j\), bởi \(l_p\ge l_a\) và \(d_j\le d_i\). Phương án sau hoán đổi vẫn hợp lệ và vẫn dùng cùng số màu.

Lập luận hoán đổi này áp dụng tương tự khi cả hai phương án dùng hai màu: thuật toán luôn lấy các màu khả dụng nhỏ nhất đáp ứng nhu cầu tất và áo, nên các màu `OPT` nhường lại luôn đủ cho những người xuất hiện muộn hơn.

#### `OPT` dùng hai màu, còn `ALG` dùng một màu

Đây là trường hợp còn lại. Gọi \(p\) là màu cấp cho áo, \(q\) là màu cấp cho tất trong `OPT`, và \(a\) là màu duy nhất `ALG` cấp cho người \(i\).

Nếu màu \(a\) còn tự do trong `OPT`, ta thay \(p,q\) bằng \(a\), làm giảm số màu đã dùng. Điều này trái với tính tối ưu của `OPT`. Vì thế, \(a\) phải đang được dùng cho một người \(j>i\).

Xét cách `OPT` dùng màu \(a\) cho người \(j\):

- Nếu \(j\) dùng \(a\) cho tất, thì \(l_a\ge2d_j\). Ta có thể thay màu \(a\) của \(j\) bằng \(q\), vì \(l_q\ge2d_i\ge2d_j\). Khi đó người \(i\) nhận \(a\), còn số màu giảm đi một, mâu thuẫn với `OPT` tối ưu.
- Nếu \(j\) dùng \(a\) cho áo, tương tự thay \(a\) bằng \(p\), vì \(l_p\ge3d_i\ge3d_j\), lại dẫn đến mâu thuẫn.
- Khả năng duy nhất không mâu thuẫn là người \(j\) dùng riêng màu \(a\) cho cả áo lẫn tất, nên \(l_a\ge5d_j\). Khi đó cấp \(a\) cho người \(i\), và thay cho người \(j\) bằng \(p\) cho áo cùng \(q\) cho tất. Các ngưỡng đều đủ vì \(d_j\le d_i\). Số màu không tăng, và người \(i\) nay được cấp đúng như `ALG`.

Như vậy, ở mọi bước ta luôn có thể sửa một lời giải tối ưu để nó trùng `ALG` thêm một người đầu tiên. Suy luận lặp cho tới hết cho thấy `ALG` là một lời giải hợp lệ tối ưu. Đồng thời, nếu `ALG` không thể cấp màu ở một bước thì lời giải `OPT` giả định không thể tồn tại; do đó in `NIE` là chính xác.

### Cài đặt hiệu quả

Sắp xếp \(n\) người theo \(d_i\) giảm dần trong \(O(n\log n)\). Với các màu kẹp, cần một cấu trúc dữ liệu hỗ trợ:

- tìm màu có số kẹp nhỏ nhất nhưng không ít hơn \(x\);
- xóa một màu khi nó đã được dùng.

`set` của thư viện chuẩn C++ đáp ứng cả hai thao tác trong \(O(\log k)\): lưu các cặp \(l_j,j\), dùng `lower_bound((x,-∞))` để tìm màu mong muốn, rồi xóa phần tử đã cấp. Khi cần hai màu, hãy tìm màu cho tất và màu cho áo trong tập hiện thời, bảo đảm chúng khác nhau; có thể tạm xóa màu đầu tiên rồi tìm màu thứ hai, hoặc thử hai thứ tự nếu cần. Một cây đoạn tĩnh, cây đếm hoặc cây Fenwick cũng có thể hiện thực các thao tác này.

Khởi tạo cấu trúc cho \(k\) màu mất \(O(k)\) (không kể chi phí chèn nếu dùng `set`). Tổng độ phức tạp của thuật toán là

\[
O\bigl(k+n(\log k+\log n)\bigr),
\]

và bộ nhớ sử dụng là \(O(n+k)\).
