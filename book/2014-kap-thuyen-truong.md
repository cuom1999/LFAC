# Thuyền trưởng ★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `kap`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/kap>

## Đề bài

Thuyền trưởng Bajtazar cùng người phó thuyền trưởng không thể thay thế của mình, Bajtek, đi lại trên vùng biển Byteotia. Trên biển có \(n\) hòn đảo, được đánh số từ \(1\) đến \(n\). Con tàu của thuyền trưởng đang neo tại đảo số \(1\), và trong chuyến thám hiểm này ông dự định đi tới đảo số \(n\).

Trong suốt hành trình, con tàu luôn di chuyển theo một trong bốn hướng: bắc, nam, đông hoặc tây. Ở mỗi thời điểm, hoặc thuyền trưởng, hoặc phó thuyền trưởng đứng lái. Mỗi khi tàu rẽ một góc \(90^\circ\), hai người lại đổi chỗ cho nhau tại bánh lái.

Trên đường đi, tàu có thể dừng tại các đảo khác. Sau mỗi lần dừng, thuyền trưởng được quyền quyết định mình có phải là người cầm lái đầu tiên hay không. Nói cách khác, trên mỗi chặng từ một đảo đến một đảo khác, một người điều khiển tàu khi tàu đi theo hướng bắc hoặc nam, còn người kia điều khiển khi tàu đi theo hướng đông hoặc tây. Đặc biệt, nếu cả chặng chỉ đi theo đúng một trong bốn hướng thì chỉ một người phải cầm lái trên chặng đó.

Thuyền trưởng muốn lập lộ trình cho chuyến đi sắp tới và phân chia công việc sao cho tổng thời gian ông phải cầm lái là ít nhất. Ông không quan tâm lộ trình được chọn dài đến mức nào. Tàu di chuyển với vận tốc không đổi là một đơn vị mỗi giờ.

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\)

\[
2\le n\le 200\,000,
\]

là số đảo trên biển.

Để đơn giản, ta đặt trên biển Byteotia một hệ tọa độ có hai trục song song với các hướng chính. Mỗi đảo được biểu diễn bởi một điểm. Trong \(n\) dòng tiếp theo, dòng thứ \(i\) chứa hai số nguyên \(x_i,y_i\)

\[
0\le x_i,y_i\le 1\,000\,000\,000,
\]

là tọa độ của đảo thứ \(i\). Không có hai đảo nào có cùng tọa độ.

### Dữ liệu ra

In một số nguyên: số giờ ít nhất mà thuyền trưởng phải cầm lái trên hành trình từ đảo số \(1\) đến đảo số \(n\).

### Ví dụ

**Dữ liệu vào**

```text
5
2 2
1 1
4 5
7 1
6 7
```

**Dữ liệu ra**

```text
2
```

**Giải thích.** Thuyền trưởng có thể đi theo lộ trình qua đảo \(4\):

\[
(2,2)\longrightarrow(7,1)\longrightarrow(6,7).
\]

Trên chặng từ đảo \(1\) đến đảo \(4\), ông chỉ cầm lái trong một giờ khi tàu đi về phía nam. Trên chặng thứ hai, ông chỉ cầm lái khi tàu đi về phía tây, cũng trong một giờ. Vì vậy, tổng thời gian ông phải cầm lái là \(2\) giờ.

![Hình minh họa ví dụ. Một lộ trình đạt đáp án đi từ \((2,2)\) xuống \((2,1)\), đi sang phải tới đảo \(4=(7,1)\), đi lên tới \((7,7)\), rồi đi sang trái tới đảo \(5=(6,7)\).](figures/2014-kap-fig-example.png)

## Lời giải

Ta có \(n\) điểm

\[
(x_1,y_1),(x_2,y_2),\ldots,(x_n,y_n)
\]

trên mặt phẳng và cần đi từ \(x_1,y_1\) đến \(x_n,y_n\).

### Chi phí của một chặng

Xét một chặng từ đảo \((x',y')\) đến đảo \((x'',y'')\). Tàu có thể hoàn thành chặng này bằng cách đi theo hai phương ngang và dọc. Sau khi dừng ở đảo đầu chặng, thuyền trưởng được chọn ai sẽ cầm lái trước; vì thế ông có thể chọn chỉ cầm lái trên phần di chuyển theo phương có độ dài ngắn hơn. Chi phí của chặng, tức số giờ thuyền trưởng phải cầm lái, là

\[
w\bigl((x',y'),(x'',y'')\bigr)
=\min\bigl(|x''-x'|,|y''-y'|\bigr).
\]

Do đó, bài toán trở thành tìm một lộ trình từ điểm \(1\) đến điểm \(n\) có tổng chi phí nhỏ nhất, trong đó ta được phép chuyển trực tiếp giữa hai điểm bất kỳ với trọng số như trên.

Cách đo chi phí này khá khác thường. Nói chính xác hơn, nó không phải là một metric trên tập điểm, vì bất đẳng thức tam giác có thể không đúng.

Chẳng hạn, xét ba điểm

\[
p_1=(1,1),\qquad p_2=(4,1),\qquad p_3=(4,4).
\]

Đi trực tiếp từ \(p_1\) đến \(p_3\) tốn

\[
\min(|4-1|,|4-1|)=3,
\]

nhưng đi từ \(p_1\) qua \(p_2\) rồi tới \(p_3\) có tổng chi phí bằng \(0\). Như vậy, ghé một điểm trung gian có thể rẻ hơn hẳn đi thẳng tới đích.

![Hình 1. Ba điểm \(p_1=(1,1)\), \(p_2=(4,1)\), \(p_3=(4,4)\): bước trực tiếp \(p_1\to p_3\) có chi phí \(3\), còn đường \(p_1\to p_2\to p_3\) có chi phí \(0\).](figures/2014-kap-fig-1.png)

Vì chi phí được đo theo một cách đặc biệt như vậy, một số trực giác quen thuộc về đường đi ngắn trên mặt phẳng không còn dùng được. Dù thế, lời giải cuối cùng lại khá đơn giản.

Ta có thể thử đoán rằng một lộ trình tối ưu luôn chỉ cần nhiều nhất một điểm trung gian. Điều này không đúng. Ví dụ, với năm điểm

\[
(1,1),\ (3,1),\ (3,4),\ (5,4),\ (5,6),
\]

có một lộ trình chi phí \(0\) từ điểm đầu tới điểm cuối, nhưng nó lần lượt phải đi qua cả ba điểm ở giữa.

![Hình 2. Một “cầu thang” gồm năm điểm, trong đó mỗi cặp liên tiếp nằm trên cùng một đường ngang hoặc dọc. Đường từ điểm \(1\) tới điểm \(5\) có chi phí \(0\), nhưng dùng ba điểm trung gian.](figures/2014-kap-fig-2.png)

### Chèn các điểm trung gian mà không tăng chi phí

Ta có thể di chuyển miễn phí giữa hai điểm nằm trên cùng một đường thẳng đứng hoặc nằm ngang. Tổng quát hơn, việc di chuyển giữa hai điểm sẽ rẻ nếu hoành độ hoặc tung độ của chúng gần nhau. Ta sẽ hình thức hóa nhận xét này.

Giả sử ta đi từ

\[
p_a=(x_a,y_a)
\]

đến

\[
p_c=(x_c,y_c),
\]

với \(x_a\le x_c\), và bước này có chi phí 

\[
|x_c-x_a|,
\]

nghĩa là \(|x_c-x_a|\le |y_c-y_a|\). Giả sử còn có một điểm

\[
p_b=(x_b,y_b)
\]

thỏa

\[
x_a\le x_b\le x_c.
\]

Khi ấy, ta có thể đi từ \(p_a\) tới \(p_c\) qua \(p_b\) mà không làm tăng chi phí. Thật vậy, bước thứ nhất tốn không quá

\[
|x_b-x_a|=x_b-x_a,
\]

còn bước thứ hai tốn không quá

\[
|x_c-x_b|=x_c-x_b.
\]

Vì vậy, tổng chi phí không vượt quá

\[
(x_b-x_a)+(x_c-x_b)=x_c-x_a.
\]

Suy ra, nếu bước từ \(p_a\) đến \(p_c\) có chi phí \(|x_c-x_a|\), ta có thể chèn vào giữa bước ấy **tất cả** các điểm có hoành độ nằm giữa \(x_a\) và \(x_c\), miễn là ghé chúng theo thứ tự hoành độ không giảm. Lộ trình sau khi chèn chắc chắn không đắt hơn bước đi trực tiếp. Lập luận hoàn toàn tương tự cũng đúng với tung độ.

### Chỉ cần nối các điểm kề nhau theo từng tọa độ

Trước hết, tạm giả sử không có hai điểm nào nằm trên cùng một đường thẳng đứng hoặc nằm ngang. Xét một lộ trình chi phí nhỏ nhất giữa hai điểm bất kỳ. Mỗi bước của lộ trình đi từ \(x_i,y_i\) đến \(x_j,y_j\), với chi phí bằng một trong hai giá trị

\[
|x_j-x_i|\qquad\text{hoặc}\qquad |y_j-y_i|.
\]

Theo nhận xét ở trên, ta có thể thay mỗi bước bằng một chuỗi bước đi qua tất cả các điểm có hoành độ nằm giữa \(x_i\) và \(x_j\), hoặc qua tất cả các điểm có tung độ nằm giữa \(y_i\) và \(y_j\). Trong cả hai trường hợp, tổng chi phí không tăng.

Lập hai mảng \(t_x[1..n]\) và \(t_y[1..n]\), đều chứa toàn bộ các điểm:

- trong \(t_x\), các điểm được sắp theo hoành độ không giảm;
- trong \(t_y\), các điểm được sắp theo tung độ không giảm.

Nhận xét vừa chứng minh dẫn tới kết luận then chốt: giữa hai điểm bất kỳ luôn tồn tại một lộ trình tối ưu mà ở mỗi bước, từ điểm hiện tại \(p\), ta chỉ đi đến một trong nhiều nhất bốn điểm sau:

- điểm ngay trước \(p\) trong \(t_x\);
- điểm ngay sau \(p\) trong \(t_x\);
- điểm ngay trước \(p\) trong \(t_y\);
- điểm ngay sau \(p\) trong \(t_y\).

### Dựng đồ thị và chạy Dijkstra

Ta dựng một đồ thị vô hướng \(G\), trong đó mỗi điểm là một đỉnh. Sau khi xây dựng \(t_x\) và \(t_y\), nối bằng cạnh mọi cặp điểm nằm ở hai vị trí liên tiếp trong một trong hai mảng. Gán cho cạnh nối \(i\) và \(j\) trọng số

\[
w(i,j)=\min(|x_i-x_j|,|y_i-y_j|).
\]

Đồ thị có \(n\) đỉnh và không quá \(2n-2\) cạnh trước khi loại các cạnh trùng. Theo kết luận ở phần trước, đường đi có tổng trọng số nhỏ nhất giữa hai đỉnh trong \(G\) tương ứng với lộ trình rẻ nhất giữa hai điểm trên mặt phẳng:

- mọi đường đi trong \(G\) hiển nhiên là một lộ trình hợp lệ giữa các đảo;
- ngược lại, mỗi bước của một lộ trình tối ưu trong đồ thị đầy đủ có thể được thay bằng một chuỗi cạnh giữa các điểm liên tiếp trong \(t_x\) hoặc \(t_y\), mà không làm tăng tổng chi phí.

Nếu có nhiều điểm nằm trên cùng một đường thẳng đứng hoặc nằm ngang thì thuật toán vẫn đúng. Khi sắp xếp, các điểm ấy đứng liên tiếp theo tọa độ tương ứng và được nối với nhau bởi một đường đi gồm toàn cạnh trọng số \(0\).

Cuối cùng, dùng thuật toán Dijkstra từ đỉnh \(1\). Khoảng cách ngắn nhất tìm được tới đỉnh \(n\) chính là số giờ ít nhất mà thuyền trưởng phải cầm lái.

### Độ phức tạp

Sắp xếp hai mảng \(t_x,t_y\) tốn \(O(n\log n)\) thời gian. Đồ thị có \(O(n)\) cạnh, nên Dijkstra với hàng đợi ưu tiên cũng chạy trong \(O(n\log n)\) thời gian.

Tổng độ phức tạp là

\[
O(n\log n)
\]

thời gian và

\[
O(n)
\]

bộ nhớ.
