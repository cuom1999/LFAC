# Diệt sóc đất ★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `eks`  
**Nguồn:** [AMPPZ 2011](https://oi.edu.pl/en/archive/amppz/2011/eks)

> Bản dịch dựa trên bản tiếng Anh, các trang in 23–25 (trang PDF vật lý 37–39), của *Looking for a Challenge 2*.

## Đề bài

Dick Dastardly muốn hành hạ những chú sóc đất Bytean tội nghiệp. Những sinh vật nhỏ hiền lành này sống trong các hang ở vùng cao của dãy núi High Bytemountains.

Dick tìm được một sống núi có \(n\) hang sóc đất nằm trên cùng một đường thẳng. Để đơn giản, các hang được đánh số từ \(1\) đến \(n\), theo thứ tự từ tây sang đông. Dick định tra tấn chúng bằng nhạc rock and roll. Hắn đã mua \(m\) máy phát CD, cho vào mỗi máy một album khác nhau của nhóm Bytels và đặt các máy dọc theo sống núi. Biết rằng khi mở hết âm lượng, một máy CD làm phiền mọi chú sóc đất ở các hang có khoảng cách đến máy không vượt quá \(l\) mét.

Lo lắng, các chú sóc nhờ bạn xác định những hang mà chúng sẽ không thể ngủ ngon trong mùa đông này. Nhưng sự độc ác của Dick vẫn chưa dừng lại ở đó…

Dick muốn gây rối hơn nữa nên thỉnh thoảng sẽ di chuyển các máy CD. Các chú sóc đã lấy được kế hoạch bí mật của hắn và biết chính xác rằng vào sáng ngày thứ \(i\), Dick sẽ lấy máy CD đang cách hang số \(1\) một khoảng \(p_i\) mét và chuyển nó đến điểm cách hang đó \(r_i\) mét. Hãy giúp các chú sóc đếm số hang mà sau mỗi thao tác như vậy, chúng không thể ngủ được.

### Dữ liệu vào

Dòng đầu chứa bốn số nguyên \(n,m,d,l\) (\(2\le n,m\le500\,000\), \(1\le d\le500\,000\), \(1\le l\le10^9\)), lần lượt là số hang sóc đất, số máy CD của Dick, số ngày và bán kính gây nhiễu của một máy CD.

Dòng thứ hai chứa \(n-1\) số nguyên \(x_2,x_3,\ldots,x_n\) (\(0<x_2<x_3<\cdots<x_n\le10^9\)), trong đó \(x_j\) là khoảng cách từ hang số \(j\) đến hang số \(1\).

Dòng thứ ba chứa \(m\) số nguyên \(z_1,z_2,\ldots,z_m\) (\(0\le z_1<z_2<\cdots<z_m\le10^9\)), là khoảng cách từ hang số \(1\) đến các máy CD theo thứ tự. Tất cả các máy CD đều nằm về phía đông của hang này.

\(d\) dòng tiếp theo mô tả các lần di chuyển. Dòng thứ \(i\) chứa hai số nguyên \(p_i,r_i\) (\(0\le p_i,r_i\le10^9\), \(p_i\ne r_i\)), có nghĩa là vào đầu ngày thứ \(i\), Dick chuyển máy CD đang ở vị trí cách hang số \(1\) \(p_i\) mét đến vị trí cách hang đó \(r_i\) mét về phía đông. Có thể giả sử rằng trước thao tác luôn có một máy CD tại vị trí \(p_i\), và không có máy CD nào tại vị trí \(r_i\).

### Dữ liệu ra

In ra \(d+1\) dòng. Dòng thứ \(i\), với \(1\le i\le d\), chứa một số nguyên: số hang mà sóc đất không thể ngủ ngon trong đêm trước thao tác thứ \(i\) của Dick. Dòng cuối cùng chứa số đó sau thao tác cuối cùng.

### Ví dụ

**Dữ liệu vào**

```text
5 3 4 1
2 5 6 11
2 4 8
2 1
4 10
8 6
1 8
```

**Kết quả**

```text
2
3
3
5
3
```

## Lời giải

Mọi sự việc trong bài toán diễn ra trên một đường thẳng. Ta biểu diễn vị trí các hang bằng các điểm. Đồng thời, mỗi máy CD tương ứng với một đoạn: nếu máy ở vị trí \(x\), nó gây nhiễu trên đoạn

\[
[x-l,x+l].
\]

Vì mọi đoạn đều có cùng độ dài \(2l\), để mô tả một đoạn chỉ cần lưu điểm giữa của nó, tức vị trí máy CD. Vị trí các hang không thay đổi, còn Dick thay đổi vị trí các máy CD. Nhiệm vụ là mô phỏng các thay đổi ấy và sau mỗi lần thay đổi, tính có bao nhiêu **hang khác nhau** được ít nhất một đoạn gây nhiễu phủ lên.

Điểm mấu chốt là luôn duy trì sẵn số hang đang bị phủ; khi đó việc in đáp án rất đơn giản. Một lần di chuyển máy CD được tách thành hai thao tác: xóa máy khỏi vị trí cũ, rồi chèn máy vào vị trí mới. Mỗi thao tác chỉ ảnh hưởng cục bộ: những hang bắt đầu được phủ hoặc thôi không được phủ chỉ phụ thuộc vào những đoạn kề trực tiếp với đoạn của máy được chèn hay xóa. Tính chất này đúng vì tất cả các đoạn đều có cùng độ dài.

### Các cấu trúc dữ liệu

Ta cần quản lý các máy CD bằng một cấu trúc hỗ trợ:

- chèn và xóa một phần tử;
- tìm máy CD gần nhất ở bên trái và ở bên phải của một vị trí.

Một tập có thứ tự, chẳng hạn `set` trong thư viện chuẩn C++, đáp ứng chính xác các yêu cầu này. Gọi tập lưu vị trí máy CD là \(M\). Không có hai máy nào ở cùng một vị trí theo đề bài.

Các hang không bao giờ di chuyển, nên chỉ cần lưu chúng vào mảng tăng dần \(N\), đúng theo thứ tự đầu vào. Với một đoạn tọa độ \([A,B]\), số hang thuộc đoạn đó có thể tìm bằng hai tìm kiếm nhị phân trong \(N\):

\[
\operatorname{count}(A,B)=
\operatorname{lower\_bound}(N,B+1)-
\operatorname{lower\_bound}(N,A).
\]

### Chèn một máy CD

Giả sử chuẩn bị chèn một máy tại vị trí \(x\). Trước khi chèn, hai hàng xóm trực tiếp của \(x\) trong \(M\) nằm tại \(x'\) và \(x''\), với

\[
x'<x<x''.
\]

Sau khi chèn \(x\), chỉ những hang thuộc đoạn của \(x\) nhưng chưa bị hai hàng xóm này phủ mới là các hang **mới** bị gây nhiễu. Các hang đó chính xác là những hang trong đoạn

\[
\left[
\max(x-l,\;x'+l+1),\;
\min(x+l,\;x''-l-1)
\right]. \tag{1}
\]

Thật vậy, đoạn của máy bên trái là \([x'-l,x'+l]\), nên phần không bị nó phủ bắt đầu từ \(x'+l+1\). Tương tự, phần không bị máy bên phải phủ kết thúc ở \(x''-l-1\). Giao phần còn lại với đoạn \([x-l,x+l]\) của máy mới cho công thức (1).

Do tọa độ đều nguyên, số hang trong (1) được tính bằng hai lần `lower_bound` như trên. Ta cộng số đó vào đáp án đang duy trì, rồi chèn \(x\) vào \(M\).

### Xóa một máy CD

Thao tác xóa hoàn toàn tương tự. Giả sử máy tại \(x\) có hai hàng xóm trực tiếp \(x'\) và \(x''\). Trước khi xóa, các hang trong đoạn (1) là đúng những hang chỉ được máy tại \(x\) phủ; sau khi bỏ máy, chúng không còn bị phủ nữa. Vì vậy, ta trừ số hang thuộc (1) khỏi đáp án, rồi xóa \(x\) khỏi \(M\).

Để mỗi máy luôn có cả tiền nhiệm lẫn kế nhiệm, thêm vào \(M\) hai phần tử lính canh cố định ở các vị trí

\[
-l-1 \quad\text{và}\quad 10^9+l+1.
\]

Chúng không thể gây nhiễu bất kỳ hang nào vì mọi tọa độ trong đề đều thuộc \([0,10^9]\), nhưng bảo đảm công thức vẫn dùng được tại hai đầu tập.

### Thuật toán

1. Khởi tạo \(M\) với tất cả các vị trí máy CD và hai lính canh. Khởi tạo đáp án bằng cách lần lượt chèn các máy CD thực sự vào một tập chỉ gồm lính canh, áp dụng công thức (1) mỗi lần.
2. In đáp án ban đầu.
3. Với từng thao tác \(p_i,r_i\): xóa máy ở \(p_i\), chèn máy ở \(r_i\), rồi in đáp án mới.

Mỗi lần chèn hoặc xóa cần \(O(\log m)\) để tìm các hàng xóm trong tập \(M\), và \(O(\log n)\) cho hai tìm kiếm nhị phân trong mảng hang \(N\). Vì một lần di chuyển gồm một lần xóa và một lần chèn, độ phức tạp mỗi ngày vẫn là

\[
O(\log m+\log n).
\]

Khởi tạo mất \(O(m(\log m+\log n))\) nếu chèn lần lượt, hoặc có thể tính theo cùng nguyên lý trong \(O(m\log n)\) khi đã có tập vị trí ban đầu. Bộ nhớ sử dụng là \(O(n+m)\).
