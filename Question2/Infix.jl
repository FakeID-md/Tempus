### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ b9c799e1-1d22-480e-908c-d2b630c670d0
# I implement an infix operator "⊕" such that take an DNA strand and a function name, return the value of that input function with input as DNA strand. 

# ╔═╡ 0a966fb1-2bf1-4727-b768-b9ffbd3c6a72
# Function that finds the compliment of a DNA strand

function complement(s)

	result = ""
	
	for c in s
		if c == 'A'		
			result = result * 'T'
		end

		if c == 'G'
			result = result * 'C'
		end
		
		if c == 'T'
			result = result * 'A'
		end

		if c == 'C'
			result = result * 'G'
		end
	end
	
	return result
end


# ╔═╡ 8e72539b-b3aa-4b32-b37b-81e28fad539a
complement("ATGGCTA")

# ╔═╡ 45128a79-5787-4314-affc-d0298d9e1a85
# Function that finds the reverse of a DNA strand
function Reverse(s)
	result = reverse(s)
	return result
end

# ╔═╡ 4557d697-03a7-43f8-bf88-3205e85df994
Reverse("ATGGCTA")

# ╔═╡ 473a1821-bdc5-4951-81f7-8332ca08de15
# Define the operator
x ⊕ y = y(x)

# ╔═╡ 84e06291-e816-49ef-895e-88397da7db3f
# Reverse the input strand -> ATCGGTA
println("ATGGCTA"⊕ Reverse)

# ╔═╡ a89a63ef-ac07-4f55-a244-6d489828efe5
# Find the complement of the input strand -> TACCGAT
 println("ATGGCTA" ⊕ complement)

# ╔═╡ 1ace3483-e294-4f83-b3f5-600f5bd099a6
# Find the complement of the reverse of the input strand -> TAGCCAT
 println(("ATGGCTA" ⊕ Reverse) ⊕ complement)

# ╔═╡ e6deabcd-7853-4b8a-bc0a-aa79a91b7741
# Find the complement of the reverse of the input strand -> TAGCCAT
println(("ATGGCTA" ⊕ complement) ⊕ Reverse)

# ╔═╡ 8a23dc10-9749-40a4-8fc9-ab4d47f57a4d
# Find the reverse of the reverse of the input strand, which should be itself-> ATGGCTA
println(("ATGGCTA"⊕ Reverse) ⊕ Reverse)

# ╔═╡ 205c626b-084d-405f-beff-65dcb1bfe9d1
# Find the complement of an empty string
println("" ⊕ complement)

# ╔═╡ b6b418b0-cf9b-45ff-8ba5-6c8f4ca28985
# Find the reverse of an empty string
println("" ⊕ Reverse)

# ╔═╡ 9837120e-e950-433c-a98e-8c199471c5ee
# Let's see more complicated expression
println((("ATGGCTA"⊕ Reverse) ⊕ Reverse) ⊕ complement)

# ╔═╡ ed37a88f-9e71-464f-9060-855c70711820
println((("ATGGCTA"⊕ complement) ⊕ Reverse) ⊕ complement)

# ╔═╡ aab147d0-cf5d-4577-b8b0-20b7468fa484
println(("ATGGCTA"⊕ complement ⊕ Reverse) ⊕ Reverse)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═b9c799e1-1d22-480e-908c-d2b630c670d0
# ╠═0a966fb1-2bf1-4727-b768-b9ffbd3c6a72
# ╠═8e72539b-b3aa-4b32-b37b-81e28fad539a
# ╠═45128a79-5787-4314-affc-d0298d9e1a85
# ╠═4557d697-03a7-43f8-bf88-3205e85df994
# ╠═473a1821-bdc5-4951-81f7-8332ca08de15
# ╠═84e06291-e816-49ef-895e-88397da7db3f
# ╠═a89a63ef-ac07-4f55-a244-6d489828efe5
# ╠═1ace3483-e294-4f83-b3f5-600f5bd099a6
# ╠═e6deabcd-7853-4b8a-bc0a-aa79a91b7741
# ╠═8a23dc10-9749-40a4-8fc9-ab4d47f57a4d
# ╠═205c626b-084d-405f-beff-65dcb1bfe9d1
# ╠═b6b418b0-cf9b-45ff-8ba5-6c8f4ca28985
# ╠═9837120e-e950-433c-a98e-8c199471c5ee
# ╠═ed37a88f-9e71-464f-9060-855c70711820
# ╠═aab147d0-cf5d-4577-b8b0-20b7468fa484
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
