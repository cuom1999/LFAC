# Máy bán hàng tự động ★★★

**Tác giả đề:** Jakub Pachocki  
**Tác giả lời giải:** Eryk Kopczyński  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `aut`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/aut>


## Đề bài

Byteasar học khoa học máy tính tại Đại học Bytean. Trong tòa nhà khoa của cậu có một máy bán đồ ăn vặt, cung cấp \(n\) loại đồ ăn, được đánh số từ \(1\) đến \(n\). Các loại đồ ăn có thể có giá khác nhau vì khác kích cỡ và hương vị.

Gần đây Byteasar phát hiện máy bị hỏng. Khi mua một món thuộc loại \(i\), máy còn nhả thêm một món của **mỗi** loại \(1,2,\ldots,i-1\), miễn là loại tương ứng vẫn còn trong máy. Nếu một loại nào đó đã hết thì máy đơn giản không nhả món thuộc loại ấy. Chỉ có thể mua món loại \(i\) khi máy còn ít nhất một món loại đó.

Byteasar muốn lợi dụng lỗi này. Với một số tiền cho trước, hãy xác định tổng giá trị lớn nhất — tổng các giá của mọi món nhận được — mà cậu có thể lấy từ máy. Cậu không bắt buộc phải tiêu hết tiền.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n\) và \(k\) (\(1\le n\le40\), \(1\le k\le64\,000\)), lần lượt là số loại đồ ăn và số tiền Byteasar có.

Dòng thứ hai chứa \(n\) số nguyên \(c_1,\ldots,c_n\) (\(1\le c_i\le40\)); \(c_i\) là giá của một món loại \(i\).

Dòng thứ ba chứa \(n\) số nguyên \(l_1,\ldots,l_n\) (\(0\le l_i\le40\)); \(l_i\) là số món loại \(i\) hiện có trong máy.

### Dữ liệu ra

In một số nguyên duy nhất: tổng giá trị lớn nhất của các món Byteasar có thể lấy với không quá \(k\) đơn vị tiền.

### Ví dụ

**Dữ liệu vào**

```text
6 8
7 2 3 5 7 2
1 3 0 3 2 1
```

**Dữ liệu ra**

```text
30
```

Ta mua một món loại \(6\); máy đồng thời nhả ra mỗi loại một món loại \(1,2,4,5\). Sau đó mua một món loại \(4\), và máy nhả thêm một món loại \(2\).

## Lời giải

### Thứ tự mua và cách nhìn từ phải sang trái

Trước hết, hãy xét thứ tự nên mua. Giả sử ta muốn mua các món loại \(i\) và \(j\), với \(i<j\). Tổng giá trị các món sẽ nhận được không phụ thuộc vào thứ tự mua hai món này. Tuy nhiên, nếu máy chỉ còn đúng một món loại \(i\), ta không thể bắt đầu bằng việc mua loại \(j\): món loại \(i\) sẽ bị nhả kèm và sau đó không còn gì để mua. Vì vậy, có thể giả sử các món được mua theo thứ tự **không giảm** của số loại, tức từ trái sang phải.

Ta có thể thử đệ quy mọi chiến lược mua theo thứ tự ấy, nhưng số chiến lược là quá lớn. Ta sẽ dùng quy hoạch động, với một mẹo: tuy các món thực sự được mua từ trái sang phải, quyết định *mua những món nào* sẽ được lập từ phải sang trái.

Khi đang dự định mua một món loại \(j\), ta biết chắc sẽ nhận được mọi món còn có thể nhận của các loại \(i<j\). Chúng có thể được nhả ngay cùng món \(j\), hoặc cùng một món khác sẽ mua trước đó, nhưng điều này không ảnh hưởng đến tổng giá trị.

Biểu diễn mỗi loại \(i\) bằng một cột cao \(l_i\), và ghi \(c_i\) trong mọi ô của cột. Với dữ liệu ví dụ ta được:

```text
3 |     2        5
2 |     2        5     7
1 | 7   2        5     7     2
  +-----------------------------
    1   2   3    4     5     6
```

Chọn một món loại \(4\) và một món loại \(6\), như trong ví dụ. Nếu thực hiện từ trái sang phải, ta mua loại \(4\) trước và nhận tổng giá trị \(7+2+5\); sau đó mua loại \(6\) và nhận thêm \(2+5+7+2\). Đến lúc mua món thứ hai, loại \(1\) đã hết nên không nhận thêm món loại \(1\).

Ta có thể lập kế hoạch tương đương theo chiều ngược lại. Trước tiên chọn mua loại \(6\), khi đó chắc chắn nhận các món có giá \(7+2+5+7+2\). Sau đó chọn mua loại \(4\), nhưng nhớ rằng món loại \(1\), vốn chỉ có một chiếc, đã được tính vào giá trị nhận được khi chọn loại lớn hơn nên không được tính lần nữa. Khi lập kế hoạch, thậm chí có thể chọn mua loại \(i\) dù trước đó đã dự định mua nhiều hơn \(l_i\) món có số loại lớn hơn; điều duy nhất bị cấm là **trực tiếp** mua quá \(l_i\) món loại \(i\).

### Các tổng tiền tố trên các hàng

Trong cách nhìn này, mỗi hàng chỉ chọn đúng một ô. Để tính giá trị nhanh, với ô ở cột \(i\), hàng \(y\), gọi \(t[i,y]\) là tổng tiền tố trên hàng đó, từ cột \(1\) đến cột \(i\). Với ví dụ:

\[
t[6,1]=7+2+5+7+2=23,
\qquad
t[4,2]=2+5=7.
\]

Sau khi thay mỗi ô bằng tổng tiền tố tương ứng, bảng trở thành:

```text
3 | 0   2   2    7     7     7
2 | 0   2   2    7    14    14
1 | 7   9   9   14    21    23
  +-----------------------------
    1   2   3    4     5     6
```

Do đó, đi từ hàng dưới lên, chiến lược chọn một ô \((i,y)\) trên mỗi hàng, thỏa các điều kiện:

- ô được chọn ở hàng kế tiếp không được nằm bên phải ô đã chọn ở hàng bên dưới;
- cột \(i\) được chọn nhiều nhất \(l_i\) lần;
- tổng các giá \(c_i\) của các ô được chọn không vượt quá ngân sách \(k\);
- tổng các giá trị \(t[i,y]\) tại những ô được chọn là lớn nhất có thể.

Ta chọn các ô theo thứ tự từ phải sang trái. Giả sử vừa xét xong cột \(i\) và đã chọn trong cột này một số ô từ \(0\) đến \(l_i\). Từ lập luận trên, thông tin duy nhất về các ô đã chọn trong những cột \(j\ge i\) cần cho các bước sau là:

- tổng số ô đã chọn, ký hiệu \(y\);
- ngân sách còn lại, ký hiệu \(b\).

Vì thế ta dùng đệ quy có nhớ hoặc quy hoạch động. Mỗi trạng thái \((i,y,b)\) chỉ cần được tối ưu một lần. Đặt \(w[i,y,b]\) là giá trị tối ưu của trạng thái đó. Nếu chọn \(s\) ô trong cột \(i\), ta có công thức:

\[
w[i,y,b]=
\max_{0\le s\le l_i}
\left\{
w[i+1,y-s,b+s\cdot c_i]
+\sum_{h=1}^{s}t[i,y-h+1]
\right\}.
\tag{1}
\]

Ở đây chỉ xét các lựa chọn \(s\) khiến chỉ số của trạng thái hợp lệ. Công thức đúng vì \(s\) ô mới được chọn là \(s\) hàng cao nhất chưa được xử lý trong cột \(i\); mỗi ô đóng góp đúng tổng tiền tố ở hàng tương ứng, còn phần bên phải cột \(i\) đã được tối ưu trong trạng thái kế tiếp.

### Độ phức tạp của quy hoạch động cơ bản

Gọi \(C\) là giá lớn nhất của một món và \(L\) là số món nhiều nhất của cùng một loại. Chỉ số \(i\) nhận \(O(n)\) giá trị, \(y\) nhận \(O(L)\) giá trị — không có ích gì khi trực tiếp mua quá \(L\) món — và \(b\) nhận \(O(k)\) giá trị. Bảng có \(O(nLk)\) ô. Mỗi ô thử tối đa \(L\) giá trị của \(s\), nên thời gian là

\[
O(nL^2k).
\]

Với các giới hạn ban đầu, đó xấp xỉ \(40^3\cdot64\,000\approx4\cdot10^9\) phép toán, vẫn quá lớn. Nhưng giới hạn \(k\) lớn đến vậy không thực sự cần thiết. Nếu trực tiếp mua \(L\) món có số loại lớn nhất, ta nhận được toàn bộ món trong máy; chi phí nhiều nhất là \(LC\), phần tiền thừa có thể đem làm từ thiện. Vì vậy có thể thay ngân sách bằng

\[
K=\min(k,LC).
\]

Khi đó thời gian giảm còn

\[
O(nL^3C),
\]

và với dữ liệu cực đại, số phép toán vào cỡ \(40^5\approx10^8\). Bộ nhớ là \(O(nL^2C\). Chỉ cần giữ hai lớp liên tiếp theo \(i\), nên giảm được thành \(O(L^2C\).

## Lời giải nhanh hơn

Quy hoạch động trên đã đủ để được chấp nhận trong cuộc thi, kể cả khi không giảm bộ nhớ. Tuy nhiên, có một lời giải nhanh hơn; dưới đây là phác thảo ý tưởng.

Trong (1), ta phải tính rất nhiều giá trị cực đại. Với một \(i\) cố định, duyệt mọi giá trị có thể của \(b\), và lần lượt tính

\[
w[i,y,b-y\cdot c_i]
\]

cho từng \(y\).

Tạm bỏ qua hạng

\[
\sum_{h=1}^{s}t[i,y-h+1].
\]

Hai giá trị liên tiếp

\[
w[i,y,b-y\cdot c_i]
\quad\text{và}\quad
w[i,y+1,b-(y+1)c_i]
\]

là cực đại trên gần như cùng một tập con của bảng \(w\). Tập đầu là một đoạn dài \(l_i\) trên một lát cắt “chéo” một chiều của bảng; khi chuyển sang tập thứ hai, chỉ thêm một phần tử ở đầu phải và bỏ một phần tử ở đầu trái.

Do đó bài toán cốt lõi trở thành: cho mảng \(M[1..N]\) và độ dài cửa sổ \(m\), hãy nhanh chóng tính cực đại của mọi đoạn độ dài \(m\), tức với mỗi \(y=1,\ldots,N-m\), tính

\[
\max M[y..y+m].
\]

Hạng vừa tạm bỏ qua cũng dễ xử lý. Khi dịch cửa sổ để tính cực đại kế tiếp, mọi giá trị trong mảng \(M\) đều tăng cùng một lượng \(t[i,y]\) nào đó. Cụ thể, thay vì lưu các giá trị

\[
M[y]=w[i+1,y,b-y\cdot c_i+s\cdot c_i]
+\sum_{h=1}^{s}t[i,y-h+1],
\]

ta lưu một độ lệch chung \(\delta\), còn trong mảng chỉ lưu

\[
M'[y]=M[y]-\delta.
\]

Giá trị thực cần lấy cực đại là \(M'[y]+\delta\). Khi cửa sổ dịch sang phải, thêm phần tử mới theo công thức

\[
M'[y]=w[i+1,y,b-y\cdot c_i],
\]

cập nhật \(\delta\) thêm \(t[i,y]\), rồi giá trị \(w[i,y,b-y\cdot c_i]\) chính là cực đại của đoạn cửa sổ tương ứng trong \(M'\), cộng với \(\delta\).

### Tính cực đại trượt

Ta còn cần tính cực đại của các cửa sổ độ dài \(m\) trong \(M[1..N]\) trong \(O(N)\). Dịch cửa sổ từ trái sang phải và duy trì tập \(S\) gồm những vị trí hiện tại hoặc có thể trở thành cực đại trong tương lai. Chính xác hơn, một vị trí thuộc \(S\) nếu ở bên phải nó, trong cửa sổ, không có giá trị nào lớn hơn hoặc bằng nó.

Nếu

\[
S=\{x_1,\ldots,x_r\},
\]

thì dãy \(x_1,\ldots,x_r\) tăng dần, còn dãy \(M[x_1],\ldots,M[x_r]\) giảm dần. Cực đại của cửa sổ là \(M[x_1]\).

Mỗi lần dịch cửa sổ một vị trí:

1. nếu cực đại cũ rơi ra ở mép trái, loại \(x_1\) khỏi \(S\);
2. thêm vị trí mới ở mép phải, đồng thời loại ở cuối \(S\) mọi vị trí có giá trị không lớn hơn giá trị mới.

Mỗi vị trí được thêm đúng một lần và loại đúng một lần, nên tổng số thao tác là \(O(N)\). Có thể cài đặt \(S\) bằng hàng đợi hai đầu trong mảng; mọi thao tác khi đó đều \(O(1)\).

Nhờ cực đại trượt, toàn bộ bài toán giải được trong

\[
O(nLk).
\]

Thay \(k\) bằng \(\min(k,LC)\) như trên cho thời gian cuối cùng

\[
O(nL^2C).
\]
