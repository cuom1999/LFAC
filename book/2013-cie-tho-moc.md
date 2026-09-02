# Thợ mộc ★★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `cie`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/cie>


## Đề bài

Byteasar muốn chơi cờ đam, nhưng bàn cờ của cậu đã bị thất lạc đâu đó. Cậu chỉ tìm được một tấm ván gỗ kích thước \(n\times m\), được chia thành \(nm\) ô vuông bằng nhau. Mỗi ô được sơn trắng hoặc đen, nhưng cách phân bố màu trên tấm ván không nhất thiết tạo thành một bàn cờ đúng chuẩn. Vì vậy Byteasar quyết định tận dụng kỹ năng thợ mộc của mình: dùng cưa cắt ra một bàn cờ, tức một hình vuông gồm một số ô, sao cho mọi hai ô chung cạnh có màu khác nhau.

Không rõ liệu Byteasar có tìm được trên tấm ván một hình vuông có kích thước phù hợp hay không. Do đó, cậu quyết định cắt từ tấm ván **hai mảnh hình tam giác** rồi ghép chúng lại để tạo thành một bàn cờ. (Hai mảnh phải rời nhau, nhưng sau khi cắt có thể xoay chúng tùy ý.) Hãy giúp Byteasar tính kích thước lớn nhất của bàn cờ mà cậu có thể tạo được theo cách này.

Ví dụ trong đề gốc minh họa một tấm ván \(4\times5\) và hai tam giác có thể ghép thành bàn cờ \(3\times3\).

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n\) và \(m\) (\(1\le n,m\le1000\)), là kích thước tấm ván. \(n\) dòng tiếp theo, mỗi dòng chứa \(m\) số nguyên: số thứ \(j\) của dòng thứ \(i\) (\(1\le i\le n\), \(1\le j\le m\)) mô tả màu của ô nằm ở giao của cột \(j\) và hàng \(i\). Số \(0\) là ô trắng, số \(1\) là ô đen.

### Dữ liệu ra

In một số nguyên duy nhất: kích thước lớn nhất của bàn cờ có thể thu được bằng cách cắt hai mảnh tam giác từ tấm ván rồi ghép chúng lại.

### Ví dụ

**Dữ liệu vào**

```text
4 5
1 1 0 1 1
0 1 0 1 0
1 0 1 0 0
0 0 1 1 0
```

**Dữ liệu ra**

```text
3
```

Với dữ liệu vào sau:

```text
3 3
1 1 1
1 1 0
0 1 0
```

kết quả đúng là:

```text
2
```

## Lời giải

Ta có một hình chữ nhật \(n\times m\) gồm \(nm\) ô, mỗi ô đen hoặc trắng. Cần cắt từ đó hai tam giác để ghép thành một bàn cờ hình vuông có cạnh lớn nhất có thể.

### Hình dạng của hai mảnh

Cách duy nhất để chia một hình vuông cạnh \(k\) thành hai tam giác là cắt theo một đường chéo. Ta nhận được hai tam giác vuông, mỗi tam giác có hai cạnh góc vuông cùng dài \(k\). Các ô của mỗi tam giác được tô theo mẫu bàn cờ; hơn nữa, các ô nằm tại góc vuông của hai tam giác có cùng màu.

Do đó, chỉ cần cắt những tam giác có hai cạnh góc vuông song song với các cạnh của hình chữ nhật ban đầu. Hai tam giác được chọn phải rời nhau. Hai tam giác kiểu này trên mặt phẳng luôn có thể được ngăn cách bởi một đường thẳng: ngang, dọc, hoặc chéo theo một trong hai hướng. Vì thế, với mỗi đường thẳng như vậy và mỗi trong hai màu, ta muốn biết ở **mỗi phía** của đường thẳng, tam giác bàn cờ lớn nhất có góc vuông mang màu đã chọn là bao nhiêu. Ở đây, *kích thước* tam giác là độ dài hai cạnh góc vuông của nó.

Có \(n+1\) đường ngang, \(m+1\) đường dọc, và \(n+m+1\) đường cho mỗi trong hai hướng chéo. Tổng cộng là

\[
3n+3m+4
\]

đường thẳng. (Để mô tả đơn giản hơn, ta cũng tính các đường trùng với cạnh của hình chữ nhật hoặc đi qua các góc của nó.) Nếu biết kích thước tam giác lớn nhất ở hai phía của mỗi đường, ta có thể xác định đáp án trong \(O(n+m)\): với từng đường, ghép tam giác tốt nhất ở phía này với tam giác tốt nhất cùng màu góc vuông ở phía kia, rồi lấy giá trị lớn nhất có thể.

Một tam giác có một trong bốn hướng, tùy theo phía nào của đỉnh góc vuông chứa cạnh huyền. Phần còn lại mô tả thuật toán khi hướng đã cố định. Chạy nó bốn lần, mỗi lần quay toàn bộ hình chữ nhật \(90^\circ\), sẽ xử lý đủ bốn hướng.

### Các tam giác cực đại

Xét một tam giác có ô tại góc vuông mang tọa độ \((i,j)\); nói rằng tam giác được *neo* tại ô đó. Cố định hướng sao cho ô neo có cả hai tọa độ lớn nhất trong các ô thuộc tam giác. Gọi tam giác là **cực đại** nếu nó có kích thước lớn nhất trong các tam giác bàn cờ neo tại ô ấy; nói cách khác, không thể mở rộng nó bằng cách đẩy cạnh huyền ra xa hơn.

![Hình 1. Một hình chữ nhật \(5\times6\) và tam giác kích thước \(3\) neo tại \((i,j)=(3,3)\). Hình bên phải chỉ tám đường trong bốn hướng chạm tam giác; nhãn trên mỗi đường cho biết số thứ tự và phía.](figures/2013-cie-fig-1.png)

Ta tính kích thước của các tam giác cực đại tại mọi ô trong \(O(nm)\) bằng quy hoạch động đơn giản. Mọi tam giác như vậy có kích thước ít nhất \(1\). Tam giác cực đại neo ở \((i,j)\) có kích thước \(k\ge2\) khi và chỉ khi:

- hai ô \((i-1,j)\) và \((i,j-1)\) có màu khác màu ô \((i,j)\); và
- tam giác cực đại nhỏ hơn trong hai tam giác neo tại \((i-1,j)\), \((i,j-1)\) có kích thước \(k-1\).

Tương đương, nếu \(d[i][j]\) là kích thước tam giác cực đại neo tại \((i,j)\), thì

\[
d[i][j]=
\begin{cases}
1+\min(d[i-1][j],d[i][j-1]), & \text{nếu hai ô nêu trên tồn tại và đều trái màu }(i,j),\\
1, & \text{ngược lại.}
\end{cases}
\]

Với mỗi nửa mặt phẳng do một đường xét ở trên tạo ra, trước hết ta sẽ tìm tam giác cực đại lớn nhất nằm trong nửa mặt phẳng ấy **và chạm** đường thẳng. Có hai trường hợp: tam giác chạm đường tại đỉnh góc vuông, hoặc không. Từ đó ta sẽ suy ra tam giác bất kỳ lớn nhất chạm đường. Bước này cần thiết vì tam giác lớn nhất chạm một đường có thể không cực đại: nếu mở rộng nó, một phần tam giác sẽ vượt sang phía bên kia đường. Cuối cùng, ta suy ra tam giác lớn nhất nằm hoàn toàn ở mỗi phía của mọi đường.

### Tam giác cực đại chạm các đường

Mỗi tam giác cực đại vừa tìm được chạm đúng tám đường trong tập đường đang xét; ba trong số đó được chạm ở đỉnh góc vuông. Mỗi đường được nhận diện bằng bốn thông tin:

1. hướng của đường;
2. số thứ tự của đường;
3. phía mà tam giác nằm;
4. màu của ô tại góc vuông;

và ta còn cần biết liệu đường có được chạm ở góc vuông hay không.

Đánh số các đường cùng một kiểu như sau. Với đường ngang (hướng \(0\)) và dọc (hướng \(1\)), số của đường là khoảng cách đến cạnh song song của hình chữ nhật nằm cùng phía với tam giác. Với hai hướng chéo (hướng \(2\), \(3\)), số của đường là **hai lần** khoảng cách đến đỉnh xa nhất của hình chữ nhật nằm cùng phía với tam giác. Cách đánh số này gần như không đổi khi quay hình chữ nhật \(90^\circ\): các đường hướng \(0\) đổi với hướng \(1\) cùng số, và hướng \(2\) đổi với hướng \(3\) cùng số. Nhờ vậy, có thể kết hợp kết quả của bốn lần quay một cách dễ dàng.

Xét tam giác cực đại kích thước \(k\), neo tại \((i,j)\). Bảng dưới liệt kê tám đường mà tam giác chạm. Cột **phía** là phía của đường chứa tam giác, còn cột **chạm tại góc vuông** chỉ ra đường có đi qua đỉnh góc vuông không.

| Hướng | Số đường | Phía | Chạm tại góc vuông |
|---:|---:|---:|:---:|
| \(0\) | \(i+1\) | \(0\) | có |
| \(0\) | \(n-i+k-1\) | \(1\) | không |
| \(1\) | \(j+1\) | \(0\) | có |
| \(1\) | \(m-j+k-1\) | \(1\) | không |
| \(2\) | \(i+j+2\) | \(0\) | có |
| \(2\) | \(n+m-i-j+k-2\) | \(1\) | không |
| \(3\) | \(n-i+j+k\) | \(0\) | không |
| \(3\) | \(m-j+i+k\) | \(1\) | không |

Vậy ta duyệt mọi tam giác cực đại và cập nhật giá trị lớn nhất cho mỗi tổ hợp của năm thông tin trên (hướng, số đường, phía, màu ở góc vuông, và cờ “chạm tại góc vuông”). Mỗi tam giác được xử lý trong thời gian hằng số, nên pha này tốn \(O(nm)\).

### Các tam giác còn lại

Giả sử đã có, với từng loại đường, kích thước lớn nhất của một tam giác cực đại chạm đường đó. Một lượt quét là đủ để tính kích thước lớn nhất của **mọi** tam giác chạm từng đường.

Quan sát then chốt: nếu dịch một đường đang chạm tam giác kích thước \(k\) về phía tam giác, ta nhận được một đường chạm một tam giác kích thước \(k-1\). Thông tin đường có chạm tại góc vuông hay không là quan trọng, vì trong trường hợp chạm tại góc vuông, tam giác nhỏ hơn có màu ở góc vuông ngược lại. Ta thực hiện phép quét này bằng quy hoạch động, duyệt các đường của một kiểu theo thứ tự **giảm** dần của số đường.

Sau đó, thêm một lượt quét cho phép tính kích thước lớn nhất của mọi tam giác nằm trong từng nửa mặt phẳng, kể cả khi chúng không chạm đường biên. Lần này dùng quan sát hiển nhiên rằng: khi dời một đường ra xa tam giác kích thước \(k\), đường đó trở thành biên của một nửa mặt phẳng vẫn chứa nguyên tam giác kích thước \(k\). Vì vậy ta duyệt các đường của một kiểu theo thứ tự **tăng** dần của số đường.

Cả hai lượt quét, trên tất cả các loại đường và trạng thái màu/phía, mất \(O(nm)\).

### Tổng kết

Sau bốn hướng, ta có thuật toán thời gian và bộ nhớ

\[
O(nm).
\]

Về ý tưởng, lời giải không khó: phần chính là quy hoạch động. Tuy nhiên, cài đặt khá thử thách. Cần xét cẩn thận mọi trường hợp, thao tác chính xác với không gian trạng thái nhiều chiều (đối với một tam giác cực đại chạm đường phải lưu năm thông tin: hướng, phía, số đường, màu ô tại góc vuông, và cờ cho biết đường có chạm ô đó), đồng thời chọn cách biểu diễn trạng thái giúp xử lý thuận tiện các trường hợp khác nhau — đặc biệt là cách đánh số đường.
