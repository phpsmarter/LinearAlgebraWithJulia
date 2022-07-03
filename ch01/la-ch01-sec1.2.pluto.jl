### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ f246cd2c-f901-11ec-01b6-c185ac20e7d7
begin
        using PlutoUI,HypertextLiteral,LaTeXStrings
       
        @htl("""<script src="https://cdn.bootcdn.net/ajax/libs/mathjax/3.2.0/es5/tex-svg-full.min.js"></script>
        """)
        PlutoUI.TableOfContents()
 end

# ╔═╡ 0945beed-2bf8-4d44-8788-477dbd4f1343
PlutoUI.Resource("https://tva1.sinaimg.cn/thumbnail/e6c9d24egy1h2alsw1tzxj20m80gomxn.jpg")


# ╔═╡ 93281c01-904d-45f7-96c8-9012d69fafb6
md"""
# ch01 sec1.2  线性方程组的代数视点

!!! outcomes
    - A 识别线性方程和非线性方程的区别
    - B 判断一组实数是否是一个线性方程组的解
    - C 理解方程组有解和无解的意义
"""

# ╔═╡ 36f00ab0-c5eb-4c02-b81f-1f8bb51c4bd3
md"""

!!! definitions
    线性方程有如下形式:

    $a_1x_1+a_2x_2+...+a_nx_n=b$

    $a_1,a_2...a_n称为方程的系数$ 
    $b 是实数, 定义为方程的常数项$
    $x_1,x_2...x_n 为方程的变量$ 



在线性方程中只能出现 系数和未知数的乘积形式, 不能出现变量与变量的乘积形式, 变量也不能有高次项和根号出现.


!!! example
    example 1
    下面的方程哪些是线性的,哪些不是线性的?
    
    $2x+3y=5$
    $2x^2+3y=5$
    $2\sqrt{x}+3y=5$
    $\sqrt{2}x+3y=5^2$

依据上面的标准
  1. 为线性方程
  2. 为非线性方程, 变量有二次项
  3. 为非线性方程, 变量有根号
  4. 为线性方程, 尽管常数项是二次项, $x$ 系数为根号项.但是满足判断条件


!!! example
    example 2
    线性方程组的解

    对于方程 $2x+3y-4z=5$, 下列条件哪些是方程的解? (a) $(x,y,z)=(1,1,0)$,(b) $(x,y,z)=(0,3,1)$,(c) $(x,y,z)=(1,1,1)$
    讲假设的解带入方程, 等式两边相等就是方程的解
    从下面代码中可以看到,a,b为方程的解, c不是方程的解
"""

# ╔═╡ 9d903a10-1746-4a72-8277-1fd105fb2d1b
let
	solcollections=[[1,1,0],[0,3,1],[1,1,1]]
	function sol(x)
	      x,y,z=x[1],x[2],x[3]
	      
	      return  2x+3y-4z== 5 ? "T" : "F"
    end

	@show res=[sol(x) for x in solcollections]
end

# ╔═╡ d11ee2cb-11fc-4812-9071-3ea307ae2f9c
md"""
!!! definitions
    线性方程组有如下形式:

    $a_{11}x_1+a_{12}x_2+...+a_{1n}x_n=b_1$
    $a_{21}x_1+a_{22}x_2+...+a_{2n}x_n=b_2$
    $...$
    $a_{m1}x_1+a_{2=m2}x_2+...+a_{mn}x_n=b_m$

其中 $a_{ij}$ 和$b_i$ 是 系数和常量, $x_1,x_2,x_n$ 是未知变量. 

方程组的解要满足所有的方程. 


!!! example
    example 2
    判断下面的解是否满足线性方程:

    $2x+3y-4z=5$
    $-2x+y+2z=-1$
    a $(x,y,z)=(1,1,0)$, b $(x,y,z)=(6,3,4)$,c  $(x,y,z)=(0,3,1)$


从下面代码可以看到:  a,b 为方程组的解, c不是方程组的解

"""

# ╔═╡ 7c7d6750-aea6-46b6-87f7-39cd9e7a1c62
let
	solcollections=[[1,1,0],[6,3,4],[0,3,1]]
	function sol(x)
	      x,y,z=x[1],x[2],x[3]
	      res1 = 2x + 3y- 4z
		  res2 = -2x + y+ 2z
	      return  res1==5&&res2==-1  ? "T" : "F"
    end

	@show res=[sol(x) for x in solcollections]
end


# ╔═╡ c647a902-fe22-4c74-b13b-69edadf49d7b
md"""
!!! exercise
    练习1.1.2
    
    $2x+2y+3z+4w=4$
    $x+y+z+w=2$
    $x+2y+2z+w=2$
    下面解是否满足线性方程组

    a $(x,y,z,w)=(2,0,-2,2)$, b $(x,y,z,w)=(2,2,-2,0)$,c $(x,y,z,w)=(1,1,-1,1)$
    d $(x,y,z,w)=(3,0,-1,1)$,e $(x,y,z,w)=(2,-2,2,0)$

代码如下

几个候选解中只有 $c$ 和 $e$ 满足同时满足三个方程 
"""

# ╔═╡ b864a9a4-3d11-4ebc-b2a9-fb7504fc9ff4
let
	solcollections=[(2,0,-2,2),(2,2,-2,0),(1,1,-1,1),(3,0,-1,1),(2,-2,2,0)]
    function sol(x)
	      x,y,z,w=x[1],x[2],x[3],x[4]
	      res1 = x + 2y + 3z + 4w
		  res2 = x + y + z + w
		  res3 = x + 2y + 2z + w
	      return Dict(
			  "1eq"=> res1==4,
			  "2eq"=> res2==2,
			  "3eq"=> res3==2,
			  "system"=>res1==4&&res2==2&&res3==2  ? "T" : "F"
		  ) 
    end

	@show res=[sol(x) for x in solcollections]
end

# ╔═╡ 6fe10161-1fe7-456e-9fbe-8ed5970dd2d4
    @htl("""<script src="https://cdn.bootcdn.net/ajax/libs/mathjax/3.2.0/es5/tex-svg-full.min.js"></script>
    """)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~0.9.4"
LaTeXStrings = "~1.3.0"
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─0945beed-2bf8-4d44-8788-477dbd4f1343
# ╟─f246cd2c-f901-11ec-01b6-c185ac20e7d7
# ╟─93281c01-904d-45f7-96c8-9012d69fafb6
# ╠═36f00ab0-c5eb-4c02-b81f-1f8bb51c4bd3
# ╠═9d903a10-1746-4a72-8277-1fd105fb2d1b
# ╠═d11ee2cb-11fc-4812-9071-3ea307ae2f9c
# ╠═7c7d6750-aea6-46b6-87f7-39cd9e7a1c62
# ╠═c647a902-fe22-4c74-b13b-69edadf49d7b
# ╠═b864a9a4-3d11-4ebc-b2a9-fb7504fc9ff4
# ╟─6fe10161-1fe7-456e-9fbe-8ed5970dd2d4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
