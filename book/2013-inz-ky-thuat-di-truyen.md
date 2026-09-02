# Kỹ thuật di truyền ★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `inz`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/inz>


## Đề bài

Các nhà cổ sinh vật học Bytean vừa khai quật được vài mẩu hổ phách, bên trong có những con muỗi cổ bị mắc kẹt. Phân tích mẫu vật cho thấy chúng thuộc kỷ Jura, nên có lẽ từng tiếp xúc với các loài bò sát khổng lồ đã thống trị vùng đất Bytean khi ấy. Điều đó gợi cho các nhà di truyền học một ý tưởng thú vị: thử khôi phục vật liệu di truyền của **byteoraptor** từ máu muỗi.

Giống như mọi sinh vật Bytean, bộ gen byteoraptor là một dãy gồm một số **byteo-amino acid**. Để đơn giản, loại của mỗi byteo-amino acid được ký hiệu bằng một số tự nhiên. Bộ gen có tính dư thừa: mỗi loại byteo-amino acid được lặp đúng \(k\) lần; đặc biệt, độ dài của mọi bộ gen hợp lệ là bội của \(k\). Nói cách khác, nếu chia bộ gen thành các khối liên tiếp, mỗi khối gồm \(k\) byteo-amino acid, thì mọi byteo-amino acid trong cùng một khối có cùng loại.

Các nhà di truyền học đã tách được từ máu một con muỗi một dãy nghi vấn gồm \(n\) byteo-amino acid. Không may, dãy này có thể không phải một bộ gen hợp lệ: nó có thể đã bị lẫn các byteo-amino acid ngoại lai. Họ muốn kiểm tra giả thuyết ấy bằng cách xóa **ít nhất** số byteo-amino acid khỏi dãy sao cho phần còn lại là một bộ gen hợp lệ. Nếu có nhiều kết quả tốt như nhau, họ quan tâm đến bộ gen đứng sớm nhất theo thứ tự từ điển. Hãy giúp họ thực hiện khám phá này.

Hai dãy khác nhau \(l_1,l_2\) có cùng độ dài được so sánh theo thứ tự từ điển tại vị trí đầu tiên mà chúng khác nhau; dãy có số nhỏ hơn ở vị trí đó đứng trước.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,k\)

\[
1\le n\le1\,000\,000,\qquad 2\le k\le1\,000\,000,
\]

lần lượt là độ dài dãy đã tách được và mức độ dư thừa của một bộ gen hợp lệ.

Dòng thứ hai chứa \(n\) số nguyên

\[
g_1,\ldots,g_n\qquad (1\le g_i\le1\,000\,000),
\]

là các loại byteo-amino acid liên tiếp trong dãy.

### Dữ liệu ra

In hai dòng. Dòng đầu là số nguyên \(m\)

\[
0\le m\le n,
\]

là độ dài lớn nhất của một bộ gen hợp lệ có thể nhận được sau khi xóa một số phần tử của dãy đã cho.

Dòng thứ hai in \(m\) số mô tả các loại byteo-amino acid liên tiếp trong bộ gen hợp lệ đó. Nếu có nhiều lời giải, in lời giải nhỏ nhất theo thứ tự từ điển. Nếu \(m=0\), tức không tách được bộ gen không rỗng nào, dòng thứ hai phải để trống.

### Ví dụ

**Dữ liệu vào**

```text
16 3
3 2 3 1 3 1 1 2 4 2 1 1 2 2 2 2
```

**Dữ liệu ra**

```text
9
1 1 1 2 2 2 2 2 2
```

## Lời giải

Trong phần này, bỏ qua bối cảnh khảo cổ. Ta có dãy

\[
g_1,g_2,\ldots,g_n
\]

gồm các số nguyên từ \(1\) đến \(M\), và số \(k\). Một dãy được gọi là **hợp lệ** nếu độ dài của nó chia hết cho \(k\), và khi chia thành các khối liên tiếp gồm \(k\) phần tử thì mọi phần tử của từng khối bằng nhau. Ta cần tìm dãy con hợp lệ dài nhất của dãy đầu vào; trong các dãy dài nhất, chọn dãy nhỏ nhất theo thứ tự từ điển.

### Tìm độ dài tối ưu

Chỉ tìm độ dài của dãy con cần chọn là khá dễ. Duyệt dãy từ trái sang phải và đếm số lần xuất hiện của mỗi giá trị kể từ sau khối đã chọn gần nhất. Ngay khi đã thấy \(k\) lần xuất hiện của một giá trị \(x\), chọn đúng \(k\) lần xuất hiện ấy làm một khối

\[
x,x,\ldots,x,
\]

rồi đặt lại mọi bộ đếm về \(0\) và tiếp tục duyệt phần đuôi còn lại.

Đây là tham lam đúng cho **số khối**: thời điểm có thể hoàn thành khối đầu tiên được chọn là sớm nhất có thể. Vì vậy phần dãy còn lại là dài nhất có thể trong mọi cách chọn khối đầu tiên; áp dụng lập luận tương tự cho phần đuôi cho ta số khối tối đa. Gọi độ dài kết quả là \(s\).

Tuy nhiên, cách này không nhất thiết cho dãy nhỏ nhất từ điển. Ví dụ với \(k=3\) và dãy

\[
4,4,1,1,4,1,7,7,2,7,
\]

thuật toán trên lập tức gặp ba số \(4\), chọn khối \((4,4,4)\), rồi chọn \((7,7,7)\). Nó tạo dãy

\[
4,4,4,7,7,7.
\]

Nhưng dãy con

\[
1,1,1,7,7,7
\]

cũng có độ dài \(6\) và nhỏ hơn theo thứ tự từ điển. Lỗi là ta quyết định khối đầu tiên khi vừa thấy số \(4\) thứ ba, trong khi số \(1\) thứ ba chỉ xuất hiện muộn hơn một chút. Mặt khác, nếu cứ trì hoãn việc chọn khối đầu tiên, ta có thể không còn nhận được độ dài tối ưu.

### Biết phần đuôi còn làm được bao nhiêu

Với \(i=1,\ldots,n\), đặt \(d_i\) là độ dài của dãy con hợp lệ dài nhất có thể lấy từ hậu tố

\[
g_i,g_{i+1},\ldots,g_n.
\]

Đặt thêm \(d_{n+1}=0\). Hiển nhiên dãy

\[
d_1,d_2,\ldots,d_n
\]

không tăng. Các giá trị này có thể tính trong thời gian tuyến tính: áp dụng đúng thuật toán tham lam tìm độ dài ở trên cho dãy đảo ngược

\[
g_n,g_{n-1},\ldots,g_1.
\]

Sau khi đã biết \(s=d_1\), xét cách dựng khối đầu tiên của kết quả. Giả sử phần tử cuối cùng của khối này nằm không muộn hơn vị trí \(j\). Để toàn bộ kết quả vẫn có độ dài \(s\), trong phần còn lại phải lấy được dãy hợp lệ dài \(s-k\). Do đó cần có

\[
d_{j+1}=s-k. \tag{1}
\]

Lấy **chỉ số lớn nhất** \(j\) thỏa (1). Khi đó khối đầu tiên có thể được tạo từ \(k\) lần xuất hiện của cùng một giá trị trong đoạn

\[
g_1,\ldots,g_j.
\]

Ngược lại, khối đầu tiên của bất cứ nghiệm tối ưu nào không thể dùng \(g_{j+1}\) hoặc phần tử ở sau nó: nếu làm vậy, sau khối đầu tiên không còn đủ độ dài \(s-k\) cho phần đuôi. Vì thế, để tối thiểu hóa từ điển, chỉ việc chọn **giá trị nhỏ nhất xuất hiện ít nhất \(k\) lần** trong \(g_1,\ldots,g_j\), rồi lấy \(k\) lần xuất hiện đầu tiên của giá trị đó.

Sau khi đã chọn xong khối đầu, bỏ qua mọi phần tử đến lần xuất hiện thứ \(k\) vừa chọn và lặp lại lập luận trên cho phần dãy còn lại. Lúc này độ dài cần còn lại giảm từ \(s\) xuống \(s-k\), rồi tiếp tục giảm \(k\) sau mỗi khối. Nhờ vậy ta vừa luôn giữ được khả năng đạt độ dài tối ưu, vừa chọn nhỏ nhất từ điển ở khối đầu tiên chưa xác định.

Điều này cũng chứng minh tính đúng đắn bằng quy nạp theo số khối còn phải tạo: điều kiện (1) đặc trưng chính xác giới hạn xa nhất mà khối hiện tại được phép vươn tới; trong giới hạn đó, giá trị nhỏ nhất đủ \(k\) lần là lựa chọn từ điển tốt nhất. Phần đuôi sau lần xuất hiện thứ \(k\) của nó lại là cùng một bài toán con.

### Cài đặt dựng dãy

Ta duyệt dãy đầu vào từ vị trí hiện thời và có mảng `frequency`, trong đó `frequency[x]` là số lần giá trị \(x\) đã xuất hiện trong đoạn đang xét. Khi gặp một vị trí vẫn có thể là phần tử cuối của khối hiện tại — tức vị trí cuối cùng có

\[
d_{i+1}=\text{độ dài còn cần}-k,
\]

— ta phải biết số nhỏ nhất xuất hiện ít nhất \(k\) lần cho tới đó.

Thông tin này có thể được duy trì ngay trong lúc quét. Mỗi khi một giá trị \(x\) xuất hiện đúng lần thứ \(k\), đưa \(x\) vào tập các giá trị đã đủ \(k\) lần và cập nhật giá trị nhỏ nhất của tập. Đồng thời ghi lại vị trí xuất hiện thứ \(k\) của \(x\). Tại giới hạn cuối cùng nêu trên, giá trị nhỏ nhất đang có chính là loại tạo khối tiếp theo; vị trí đã ghi của nó cho biết nơi phải bắt đầu lần quét kế tiếp.

Sau khi chốt một khối, các bộ đếm phải trở về \(0\) để mô tả đoạn mới. Có thể thực hiện bằng cách duyệt lại phần đoạn vừa xử lý và giảm các bộ đếm tương ứng. Cách này không làm thuật toán chậm đi: các đoạn bị duyệt lại khi chốt các khối là rời nhau.

Một cách cài đặt gọn hơn cho thao tác đặt lại này được trình bày ở phần cuối.

### Độ phức tạp

Mỗi phần tử được xử lý trong thời gian hằng số. Có vẻ như việc quay lại để xóa các bộ đếm sau mỗi khối có thể khiến thời gian lớn hơn tuyến tính, nhưng không phải vậy. Nếu sau khi xử lý đến \(g_j\) ta quay lại ngay sau \(g_\ell\), thì

\[
d_{j+1}=d_{\ell+1}.
\]

Nếu lần quay lại tiếp theo diễn ra sau khi đã xử lý \(g_{j'}\), với \(j'>j\), thì

\[
d_{j'+1}<d_{j+1}.
\]

Vì vậy các đoạn chỉ số bị duyệt lại ở các lần quay lại là đôi một rời nhau. Tổng số bước của toàn bộ thuật toán là tuyến tính theo \(n\).

Ta dùng một mảng kích thước \(M\) để đếm tần suất các giá trị. Do đó thời gian chạy là

\[
O(n+M),
\]

và bộ nhớ dùng là \(O(n+M)\), gồm mảng \(d\), dãy đầu vào và các mảng phục vụ đếm.

## Mẹo cài đặt: mảng có thể xóa về \(0\) tức thời

Trong lời giải, ta thường phải xóa mọi giá trị của mảng đếm mà không muốn duyệt toàn bộ \(M\) ô. Có một kỹ thuật tổng quát tạo ra một **mảng có thể xóa về \(0\)**, hỗ trợ mỗi thao tác sau trong thời gian \(O(1)\):

- đọc một ô;
- ghi một ô;
- xóa về \(0\) toàn bộ mảng.

Với một mảng độ dài \(M\), dùng hai mảng thường `value` và `stamp`, đều dài \(M\), cùng biến số nguyên `epoch`. `value[p]` lưu dữ liệu từng ghi vào ô \(p\); `stamp[p]` lưu số hiệu thời kỳ (*epoch*) khi ô đó được ghi lần gần nhất. Mỗi lần xóa toàn bộ mảng, chỉ tăng `epoch` lên \(1\).

Khi ghi giá trị \(v\) vào ô \(p\), đặt

\[
\texttt{value}[p]=v,\qquad \texttt{stamp}[p]=\texttt{epoch}.
\]

Khi đọc ô \(p\), nếu

\[
\texttt{stamp}[p]=\texttt{epoch},
\]

thì trả về `value[p]`; nếu không, trả về \(0\). Thật vậy, trong trường hợp sau, lần ghi gần nhất xảy ra trước thời kỳ hiện tại, nên ô này đã bị xóa kể từ lần ghi đó. Ban đầu, khởi tạo hai mảng và `epoch` bằng \(0\).

Như vậy, tăng một biến duy nhất khiến mọi giá trị cũ trở nên “lỗi thời”, nên về mặt logic mọi ô đều bằng \(0\). Kỹ thuật này tránh việc phải quét cả mảng khi chuyển sang khối tiếp theo.
