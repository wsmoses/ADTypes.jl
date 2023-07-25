module ADTypes

"""
Base type for AD choices.
"""
abstract type AbstractADType end

struct AutoFiniteDiff{T1, T2, T3} <: AbstractADType
    fdtype::T1
    fdjtype::T2
    fdhtype::T3
end

function AutoFiniteDiff(; fdtype = Val(:forward), fdjtype = fdtype,
                        fdhtype = Val(:hcentral))
    AutoFiniteDiff(fdtype, fdjtype, fdhtype)
end

struct AutoFiniteDifferences{T} <: AbstractADType
    fdm::T
end

AutoFiniteDifferences(; fdm = nothing) = AutoFiniteDifferences(fdm)

struct AutoForwardDiff{chunksize,T} <: AbstractADType
    tag::T
end

function AutoForwardDiff(; chunksize = nothing, tag = nothing)
    AutoForwardDiff{chunksize,typeof(tag)}(tag)
end

struct AutoReverseDiff <: AbstractADType
    compile::Bool
end

AutoReverseDiff(; compile = false) = AutoReverseDiff(compile)

struct AutoZygote <: AbstractADType end

struct AutoEnzyme{M} <: AbstractADType
    mode::M
end

AutoEnzyme(; mode = nothing) = AutoEnzyme(mode)

struct AutoTracker <: AbstractADType end

struct AutoModelingToolkit <: AbstractADType
    obj_sparse::Bool
    cons_sparse::Bool
end

function AutoModelingToolkit(; obj_sparse = false, cons_sparse = false)
    AutoModelingToolkit(obj_sparse, cons_sparse)
end

struct AutoSparseFiniteDiff <: AbstractADType end

struct AutoSparseForwardDiff{chunksize,T} <: AbstractADType
    tag::T
end

function AutoSparseForwardDiff(; chunksize = nothing, tag = nothing)
    AutoSparseForwardDiff{chunksize,typeof(tag)}(tag)
end

export AutoFiniteDiff, AutoFiniteDifferences, AutoForwardDiff, AutoReverseDiff, AutoZygote, AutoEnzyme, AutoTracker, AutoModelingToolkit, AutoSparseFiniteDiff, AutoSparseForwardDiff
end
