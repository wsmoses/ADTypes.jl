@deprecate AutoSparseFastDifferentiation() AutoSparse(AutoFastDifferentiation())

@deprecate AutoSparseFiniteDiff(; kwargs...) AutoSparse(AutoFiniteDiff(; kwargs...))

@deprecate AutoSparseForwardDiff(; kwargs...) AutoSparse(AutoForwardDiff(; kwargs...))

@deprecate AutoSparsePolyesterForwardDiff(; kwargs...) AutoSparse(AutoPolyesterForwardDiff(;
    kwargs...))

@deprecate AutoSparseReverseDiff(; kwargs...) AutoSparse(AutoReverseDiff(; kwargs...))

@deprecate AutoSparseZygote() AutoSparse(AutoZygote())

function mtk_to_symbolics(obj_sparse::Bool, cons_sparse::Bool)
    if obj_sparse || cons_sparse
        return AutoSparse(AutoSymbolics())
    else
        return AutoSymbolics()
    end
end

function AutoModelingToolkit(obj_sparse::Bool, cons_sparse::Bool)
    Base.depwarn(
        "`AutoModelingToolkit(obj_sparse, cons_sparse)` is deprecated, use `AutoSymbolics()` or `AutoSparse(AutoSymbolics())` instead.",
        :AutoModelingToolkit; force = false)
    return mtk_to_symbolics(obj_sparse, cons_sparse)
end

function AutoModelingToolkit(; obj_sparse::Bool = false, cons_sparse::Bool = false)
    Base.depwarn(
        "`AutoModelingToolkit(; obj_sparse, cons_sparse)` is deprecated, use `AutoSymbolics()` or `AutoSparse(AutoSymbolics())` instead.",
        :AutoModelingToolkit; force = false)
    return mtk_to_symbolics(obj_sparse, cons_sparse)
end
