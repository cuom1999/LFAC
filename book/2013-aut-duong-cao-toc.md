# Đường cao tốc ★★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `aut`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/aut>


## Đề bài

Công ty AutoByte đang xây dựng một trong các đường cao tốc của Byteania. Trước đây công ty chỉ thu phí ở đầu đường cao tốc. Tuy nhiên, Byteasar, chủ tịch mới của công ty, nhận ra rằng như thế khoản tiền thu được không phụ thuộc vào số dặm Byte mà khách hàng đã đi. Vì vậy, công ty dự định xây các trạm thu phí dọc toàn bộ đường cao tốc.

Trong một chuyến đi trên đường cao tốc, Byteasar đã dùng công-tơ-mét trên xe để ghi lại vị trí của toàn bộ \(n\) lối vào (vị trí một lối vào là khoảng cách từ nó đến đầu đường cao tốc). Công ty quyết định đặt \(n+1\) trạm thu phí cách đều nhau dọc theo đường cao tốc; tức là khoảng cách giữa mọi hai trạm liên tiếp đều bằng nhau. Đồng thời, giữa mỗi hai trạm phải có một lối vào, và giữa mỗi hai lối vào liên tiếp phải có một trạm thu phí. May mắn là cách bố trí các lối vào hiện có cho phép sắp đặt như vậy.

Hãy tính khoảng cách nhỏ nhất và lớn nhất có thể giữa hai trạm thu phí. Chính xác hơn, cần tìm giá trị nhỏ nhất và lớn nhất của \(l\) sao cho tồn tại vị trí \(b_0\) của trạm đầu tiên, và các trạm tiếp theo nằm tại

\[
b_0+l,\ b_0+2l,\ \ldots,\ b_0+nl.
\]

Có thể một trạm được xác định theo cách trên trùng đúng vị trí của một lối vào. Khi đó, trạm sẽ được đặt sát lối vào, ngay trước hoặc ngay sau nó. Nói cách khác, vị trí của lối vào thứ \(j\) phải thuộc đoạn

\[
[b_0+(j-1)l,\ b_0+jl].
\]

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\) (\(3\le n\le1\,000\,000\)), là số lối vào đường cao tốc.

Dòng thứ hai chứa dãy tăng gồm \(n\) số nguyên \(a_1,a_2,\ldots,a_n\) (\(0\le a_i\le10^9\)). Các số này lần lượt là vị trí của các lối vào.

### Dữ liệu ra

In hai số thực: khoảng cách nhỏ nhất và lớn nhất có thể giữa hai trạm thu phí liên tiếp, tính bằng dặm Byte. Có thể giả sử chênh lệch giữa hai giá trị này không nhỏ hơn \(10^{-9}\).

Kết quả được coi là đúng nếu nằm trong đoạn

\[
[x(1-\varepsilon)-\varepsilon,\ x(1+\varepsilon)+\varepsilon],
\]

trong đó \(x\) là đáp án đúng và \(\varepsilon=10^{-8}\). Vì vậy cả sai số tương đối lẫn sai số tuyệt đối không quá \(\varepsilon\) đều được chấp nhận.

### Ví dụ

**Dữ liệu vào**

```text
6
2 3 4 5 6 7
```

**Dữ liệu ra**

```text
0.833333333333 1.250000000000
```

## Lời giải

Trong lời giải, ta dùng một diễn giải hình học nên sẽ đổi nhẹ ký hiệu của đề bài. Gọi \(x\) là khoảng cách giữa hai trạm liên tiếp, và \(y\) là vị trí của trạm đầu tiên. Khi đó \(n+1\) trạm được đặt ở các vị trí

\[
y,\ y+x,\ y+2x,\ \ldots,\ y+n\cdot x.
\]

Để thuận tiện, đánh số các trạm từ \(0\) đến \(n\); vì thế “trạm đầu tiên” là trạm số \(0\).

Một cách bố trí phải thỏa hai điều kiện: giữa mọi hai trạm có một lối vào, và giữa mọi hai lối vào có một trạm. Viết vị trí trạm thứ \(i\) là \(y+i\cdot x\), với \(0\le i\le n\), và vị trí lối vào thứ \(i\) là \(a_i\), với \(1\le i\le n\). Với \(i=0,\ldots,n-1\), trạm thứ \(i\) phải nằm trước lối vào thứ \(i+1\), còn trạm thứ \(i+1\) phải nằm sau lối vào ấy. Hai điều kiện là

\[
y+i\cdot x\le a_{i+1},
\]

và

\[
y+(i+1)x\ge a_{i+1}.
\]

Chuyển các hạng chứa \(x\) sang vế phải, với mọi \(i=0,\ldots,n-1\) ta có

\[
y\le a_{i+1}-i\cdot x, \tag{1}
\]

\[
y\ge a_{i+1}-(i+1)x. \tag{2}
\]

Mọi nghiệm của bài toán thỏa tất cả các bất đẳng thức (1), (2), và ngược lại mọi nghiệm của các bất đẳng thức ấy chính là một bố trí hợp lệ.

### Diễn giải hình học

Đồng nhất một bố trí có khoảng cách \(x\) và trạm đầu tại \(y\) với điểm \((x,y)\). Các bất đẳng thức (1) nói rằng nghiệm nằm trên hoặc dưới các đường thẳng

\[
y=a_{i+1}-i\cdot x,
\]

hay trong những nửa mặt phẳng bị các đường ấy chặn ở phía trên. Giao của các nửa mặt phẳng này bị chặn phía trên bởi hàm \(f_1:\mathbb{R}\to\mathbb{R}\), cho giới hạn trên chặt nhất của \(y\) tại mỗi \(x\):

\[
f_1(x)=\min_{i=0,\ldots,n-1}\{a_{i+1}-i\cdot x\}. \tag{3}
\]

Tương tự, các bất đẳng thức (2) xác định giao các nửa mặt phẳng bị chặn phía dưới bởi một hàm \(f_2\). Hàm \(f_1\) là hàm lõm, còn \(f_2\) là hàm lồi: trực quan, \(f_1\) là bao dưới của các đường thẳng trong (3), còn \(f_2\) là bao trên của các đường thẳng tương ứng với (2).

![Hình 1. Ba đường thẳng giới hạn các nửa mặt phẳng của (1); đường gấp khúc màu cam là hàm \(f_1\), tức bao dưới của chúng.](figures/2013-aut-fig-1.png)

Tập các điểm biểu diễn nghiệm là các điểm nằm không cao hơn đồ thị \(f_1\), đồng thời không thấp hơn đồ thị \(f_2\). Ký hiệu miền nằm giữa hai đồ thị là \(S\). Ta cần tìm trong \(S\) các điểm có hoành độ nhỏ nhất và lớn nhất.

![Hình 2. Miền nghiệm \(S\) nằm giữa \(f_1\) và \(f_2\); \(x_1,x_2\) là hai biên cần tìm, còn \(x_m\) cực đại hóa khoảng cách \(F(x_m)\).](figures/2013-aut-fig-2.png)

Trước hết, hãy tìm một điểm bất kỳ của \(S\). Ta biết \(S\) không rỗng, nên với một \(x\in\mathbb{R}\) nào đó phải có

\[
f_1(x)\ge f_2(x).
\]

Đặt

\[
F(x):=f_1(x)-f_2(x).
\]

Vì \(f_1\) lõm và \(f_2\) lồi, \(F\) cũng là hàm lõm. Với mỗi \(x\), ta tính được \(F(x)\) trong \(O(n)\) bằng (3) và công thức tương tự cho \(f_2\).

Điểm then chốt là dùng **tìm kiếm tam phân** để tìm hoành độ \(x_m\) làm cực đại \(F(x_m\). Chính xác hơn, sau hữu hạn vòng lặp ta tìm được một \(x_m^*\) gần tùy ý với \(x_m\); càng nhiều vòng lặp thì càng gần. Có thể bắt đầu tìm kiếm trên bất kỳ đoạn nào chứa \(x_m\), chẳng hạn \([0,a_n]\). Với giá trị cực đại đó,

\[
F(x_m)=f_1(x_m)-f_2(x_m)\ge0.
\]

Ta biết \(F\) không giảm trên \(( -\infty,x_m]\) và không tăng trên \([x_m,\infty)\). Cần tìm \(x_1\) nhỏ nhất và \(x_2\) lớn nhất sao cho \(F\) không âm. Để tìm \(x_1\), chỉ cần dùng **tìm kiếm nhị phân** trên \([0,x_m]\) để tìm nghiệm \(F(x_1)=0\). Hoàn toàn tương tự, dùng tìm kiếm nhị phân ở phía bên phải \(x_m\) để tìm \(x_2\).

Độ phức tạp là

\[
O(n\log M),
\]

trong đó \(M\) biểu thị miền giá trị của dữ liệu và độ chính xác cần đạt. Thừa số \(\log M\) xuất phát từ các phép tìm kiếm nhị phân và tam phân.

### Lời giải ngắn hơn

Ta cũng có thể giải bài bằng một thuật toán đơn giản hơn, dù kém tự nhiên hơn. Với mỗi đáp án cần tìm, ta sẽ chỉ dùng một tìm kiếm nhị phân. Cố định một khoảng cách giữa hai trạm là \(x\). Cần xác định một trong ba trường hợp: \(x\) hợp lệ (có thể đặt \(n+1\) trạm với khoảng cách đó), \(x\) quá nhỏ, hoặc \(x\) quá lớn. Nếu kiểm tra này thực hiện trong \(O(n)\), toàn bộ bài giải được trong \(O(n\log M)\).

Với \(x\) cố định, lần lượt xét các trạm và duy trì một đoạn các vị trí có thể của trạm đầu, tức các giá trị \(y\). Mỗi trạm/lối vào mới có thể thu hẹp đoạn ở cả hai phía, vì phải thêm hai bất đẳng thức (1), (2). Nếu sau khi xét toàn bộ các trạm, đoạn giá trị \(y\) còn không rỗng, \(x\) là hợp lệ.

Ngược lại, tại một thời điểm đoạn này phải rỗng: đầu phải đã đi sang trái đầu trái, hoặc ngược lại. Giả sử điều đó xảy ra khi xét trạm số \(i\), cách trạm đầu \(i\cdot x\). Để trạm nằm trước lối vào số \(i+1\), bắt buộc

\[
y\le a_{i+1}-i\cdot x.
\]

Gọi \(y_1\) là giá trị \(y\) nhỏ nhất còn cho phép ngay trước khi thêm ràng buộc này. Nếu ngay cả \(y_1\) cũng không thỏa bất đẳng thức trên, ta khẳng định \(x\) quá lớn.

Để chứng minh, xét một bố trí hợp lệ của \(i-1\) trạm đầu, vốn tồn tại trước khi đoạn bị rỗng. Dịch toàn bộ bố trí này sang trái hết mức có thể. Khi ấy trạm đầu nằm tại \(y_1\), và một trạm nào đó sẽ “tì” từ phía trái vào một lối vào ở vị trí \(a_j\). Nếu không có trạm nào tì vào lối vào thì một \(y\) nhỏ hơn nữa vẫn hợp lệ, trái với định nghĩa của \(y_1\). Nếu ngay cả trong bố trí cực trái đó, trạm thứ \(i\) đã nằm sau lối vào \(a_{i+1}\), tăng khoảng cách giữa các trạm chắc chắn không thể giúp ích: trạm đang tì vào \(a_j\) không thể bị dịch sang trái thêm. Vậy \(x\) đã chọn quá lớn.

Lập luận đối xứng cho thấy: nếu với \(y\) lớn nhất còn cho phép, ràng buộc dưới trong (2) không thỏa, thì \(x\) quá nhỏ.

Như vậy, trong \(O(n)\) ta phân loại được giá trị \(x\) đang thử là quá nhỏ, quá lớn hay hợp lệ. Hai phép tìm kiếm nhị phân lập tức cho lời giải \(O(n\log M)\).

### Lời giải nhanh hơn

Điều thú vị là bài toán còn giải được trong thời gian tuyến tính. Bước đầu tiên là dựng hiệu quả các miền phía dưới đồ thị \(f_1\) và phía trên đồ thị \(f_2\). Chỉ xét \(f_1\): ta cần dựng nó từ các bất đẳng thức (1). Có thể làm điều này bằng thuật toán tương tự thuật toán dựng bao lồi của một tập điểm.

Thuật toán bao lồi thông thường chạy trong \(O(n\log n)\), nhưng thừa số logarit chỉ đến từ việc sắp xếp theo hệ số góc. Ở đây các hệ số góc là các số nguyên liên tiếp, nên có thể thực hiện bước “sắp xếp” đó trong thời gian tuyến tính. Sau khi dựng các miền giới hạn bởi \(f_1\) và \(f_2\), ta xác định hiệu quả miền \(S\), rồi tìm hai điểm cực biên của nó.

Mặc dù có độ phức tạp tốt hơn, lời giải này không được khuyến nghị để cài đặt: việc xử lý sai số biểu diễn số thực khá rắc rối. Vì thế, nên xem nó chủ yếu như một điều thú vị về mặt lý thuyết.
